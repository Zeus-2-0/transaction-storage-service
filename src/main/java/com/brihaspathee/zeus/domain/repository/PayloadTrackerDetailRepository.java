package com.brihaspathee.zeus.domain.repository;

import com.brihaspathee.zeus.domain.entity.PayloadTrackerDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

/**
 * Created in Intellij IDEA
 * User: Balaji Varadharajan
 * Date: 11, October 2022
 * Time: 7:15 AM
 * Project: Zeus
 * Package Name: com.brihaspathee.zeus.domain.repository
 * To change this template use File | Settings | File and Code Template
 */
@Repository
public interface PayloadTrackerDetailRepository extends JpaRepository<PayloadTrackerDetail, UUID> {
}
