package com.dgut.config;

import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class MyAddInformation implements TokenEnhancer {

    @Override
    public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
        final Map<String, Object> information = accessToken.getAdditionalInformation();
        information.put("powerBy", "edward");
        ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(information);
        return accessToken;
    }

}
