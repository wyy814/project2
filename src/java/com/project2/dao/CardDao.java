package com.project2.dao;

import com.project2.entity.Card;
import java.util.List;

/**
 * Created by Administrator on 2018/10/18 0018.
 */
public interface CardDao {
    void insertCard(Card card);
    void updateCard(Card card);
    Card queryCardById(Integer id);
    List<Card> queryCardByRId(Integer rId);
}
