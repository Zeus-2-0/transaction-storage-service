package com.brihaspathee.zeus.service.impl;

import com.brihaspathee.zeus.domain.repository.PayloadTrackerRepository;
import com.brihaspathee.zeus.service.interfaces.DataCleanUpService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * Created in Intellij IDEA
 * User: Balaji Varadharajan
 * Date: 01, March 2024
 * Time: 11:59 AM
 * Project: Zeus
 * Package Name: com.brihaspathee.zeus.service.impl
 * To change this template use File | Settings | File and Code Template
 */
@Service
@RequiredArgsConstructor
public class DataCleanUpServiceImpl implements DataCleanUpService {

    /**
     * Payload Tracker repository instance
     */
    private final PayloadTrackerRepository repository;

    /**
     * Clean up the entire database in the service
     */
    @Override
    public void deleteAll() {
        repository.deleteAll();
    }
}
