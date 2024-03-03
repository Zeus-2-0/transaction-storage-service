package com.brihaspathee.zeus.web.resource.impl;

import com.brihaspathee.zeus.constants.ApiResponseConstants;
import com.brihaspathee.zeus.service.interfaces.DataCleanUpService;
import com.brihaspathee.zeus.web.model.TransactionDto;
import com.brihaspathee.zeus.web.resource.interfaces.TransactionAPI;
import com.brihaspathee.zeus.web.response.ZeusApiResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * Created in Intellij IDEA
 * User: Balaji Varadharajan
 * Date: 18, March 2022
 * Time: 11:39 AM
 * Project: Zeus
 * Package Name: com.brihaspathee.zeus.web.resource.impl
 * To change this template use File | Settings | File and Code Template
 */
@Slf4j
@RestController
@RequiredArgsConstructor
public class TransactionResource implements TransactionAPI {

    /**
     * Instance of data clean up service
     */
    private final DataCleanUpService cleanUpService;

    /**
     * Get transaction by transaction id
     * @param transactionId
     * @return
     */
    @Override
    public ResponseEntity<ZeusApiResponse<TransactionDto>> getTransactionById(String transactionId) {
        ZeusApiResponse<TransactionDto> apiResponse = ZeusApiResponse.<TransactionDto>builder()
                .response(TransactionDto.builder()
                        .transactionId("Test Transaction Id")
                        .transactionSK("Test Transaction SK")
                        .build())
                .build();
        return ResponseEntity.ok(apiResponse);
    }

    /**
     * Clean up the entire database
     * @return
     */
    @Override
    public ResponseEntity<ZeusApiResponse<String>> cleanUp() {
        cleanUpService.deleteAll();
        ZeusApiResponse<String> apiResponse = ZeusApiResponse.<String>builder()
                .response("Request deleted successfully")
                .statusCode(204)
                .status(HttpStatus.NO_CONTENT)
                .developerMessage(ApiResponseConstants.SUCCESS)
                .message(ApiResponseConstants.SUCCESS_REASON)
                .timestamp(LocalDateTime.now())
                .build();
        return new ResponseEntity<>(apiResponse, HttpStatus.NO_CONTENT);
    }
}
