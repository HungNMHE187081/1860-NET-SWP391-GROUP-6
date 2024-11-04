package config;

import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class VNPayConfig {
    // Các thông số cấu hình VNPay
    public static String vnp_Version = "2.1.0";
    public static String vnp_Command = "pay";
    public static String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    public static String vnp_ReturnUrl = "http://localhost:9998/ChildrenCare/vnpayreturn";
    public static String vnp_TmnCode = "YOUR_TMN_CODE"; // Mã website của bạn tại VNPay
    public static String vnp_HashSecret = "YOUR_HASH_SECRET"; // Chuỗi bí mật của bạn
    public static String vnp_ApiUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";
    
    // Hàm tạo số random
    public static String getRandomNumber(int len) {
        Random rnd = new Random();
        String chars = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }
    
    // Hàm format số tiền
    public static String formatAmount(double amount) {
        return String.valueOf((long)(amount * 100)); // VNPay yêu cầu số tiền * 100
    }
    
    // Hàm tạo chuỗi hash
    public static String hmacSHA512(String key, String data) {
        try {
            Mac sha512_HMAC = Mac.getInstance("HmacSHA512");
            byte[] hmacKeyBytes = key.getBytes();
            SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA512");
            sha512_HMAC.init(secretKey);
            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
            byte[] result = sha512_HMAC.doFinal(dataBytes);
            StringBuilder sb = new StringBuilder(2 * result.length);
            for (byte b : result) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();
        } catch (Exception ex) {
            return "";
        }
    }
    
    // Hàm tạo URL thanh toán
    public static String createPaymentUrl(String txnRef, double amount, String orderInfo) {
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", formatAmount(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_TxnRef", txnRef);
        vnp_Params.put("vnp_OrderInfo", orderInfo);
        vnp_Params.put("vnp_ReturnUrl", vnp_ReturnUrl);
        
        // Thêm thông tin thời gian
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        
        // Tạo chuỗi hash
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        for (String field : fieldNames) {
            hashData.append(field).append("=").append(vnp_Params.get(field)).append("&");
        }
        
        String secureHash = hmacSHA512(vnp_HashSecret, hashData.toString());
        vnp_Params.put("vnp_SecureHash", secureHash);
        
        // Tạo URL
        StringBuilder queryUrl = new StringBuilder(vnp_PayUrl + "?");
        for (Map.Entry<String, String> entry : vnp_Params.entrySet()) {
            queryUrl.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
        }
        
        return queryUrl.substring(0, queryUrl.length() - 1); // Bỏ dấu & cuối cùng
    }
}
