package com.ppi.search.service;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.ppi.search.pojo.User;

/**
 */
@Service
public class PasswordHelper {

    private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();

    private String algorithmName = "md5";
    private int hashIterations = 2;
    private String saltString="ppi_curator";

    public void setRandomNumberGenerator(RandomNumberGenerator randomNumberGenerator) {
        this.randomNumberGenerator = randomNumberGenerator;
    }

    public void setAlgorithmName(String algorithmName) {
        this.algorithmName = algorithmName;
    }

    public void setHashIterations(int hashIterations) {
        this.hashIterations = hashIterations;
    }
    
    public void encryptPassword(User user) {

        //user.setSalt(randomNumberGenerator.nextBytes().toHex());
    	
        String newPassword = new SimpleHash(
                algorithmName,
                user.getPassword(),
                ByteSource.Util.bytes(user.getUsername()),//加盐
                hashIterations).toHex();
        user.setPassword(newPassword);
    }
    public static void main(String[] args) {
    	System.out.println(new SimpleHash(
    			"md5",
                "123456",
                ByteSource.Util.bytes("admin"),//加盐
                2).toHex());
    	System.out.println(new SimpleHash(
    			"md5",
                "123456",
                ByteSource.Util.bytes("user"),//加盐
                2).toHex());
    }  
}
