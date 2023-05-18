
add_wzitem_info(wz_item_name, wz_item_title, wz_item_category) {
    wz_item_data = {
        #name: wz_item_name,
        #title: wz_item_title,
        #category: wz_item_category
    };

    array::add(self.items, wz_item_data);
    cat = self.categories[wz_item_category];
    if (isdefined(cat)) {
        array::add(cat.items, wz_item_data);
    }
}

add_wzitem_category(category_id, category_title) {
    wz_item_data = {
        #name: category_id,
        #title: category_title,
        #items: array()
    };
    self.categories[category_id] = wz_item_data;
}

get_wzitems_enum_data() {
    if (!isdefined(level.atian_enum_data)) {
        generate_enum_values();
    }
    return level.atian_enum_data.wzitems;
}

generate_wzitems_enum() {
    if (isdefined(self.wzitems)) {
        return;
    }
    wzitems = {
        #items: array(),
        #categories: array()
    };
    self.wzitems = wzitems;

    wzitems add_wzitem_category("backpack", "Backpack");
    wzitems add_wzitem_category("ee", "EE");
    wzitems add_wzitem_category("unknown", "Unknown");

    wzitems add_wzitem_info(#"backpack_item", "Backpack", "backpack");
    wzitems add_wzitem_info(#"hash_12d0b662134986e2", "Takeo", "ee");
    wzitems add_wzitem_info(#"hash_206ddd5a88e8c7c1", "Richtofen", "ee");

    wzitems add_wzitem_info(#"hash_27a77e458cb2223e", "hash_27a77e458cb2223e", "unknown");
    wzitems add_wzitem_info(#"hash_5ffca3f1385154e6", "hash_5ffca3f1385154e6", "unknown");
    wzitems add_wzitem_info(#"hash_7fe452ac99dcb25f", "hash_7fe452ac99dcb25f", "unknown");
    wzitems add_wzitem_info(#"hash_2572e1a193175b4d", "hash_2572e1a193175b4d", "unknown");
    wzitems add_wzitem_info(#"hash_2bb44d78cfdc661", "hash_2bb44d78cfdc661", "unknown");
    wzitems add_wzitem_info(#"hash_7f50125ebbc15534", "hash_7f50125ebbc15534", "unknown");
    wzitems add_wzitem_info(#"hash_5d334f942754156e", "hash_5d334f942754156e", "unknown");
    wzitems add_wzitem_info(#"hash_10db7f8ca1621554", "hash_10db7f8ca1621554", "unknown");
    wzitems add_wzitem_info(#"hash_27d464e9703672a1", "hash_27d464e9703672a1", "unknown");
    wzitems add_wzitem_info(#"hash_2011eafeff274fc8", "hash_2011eafeff274fc8", "unknown");
    /*
    wzitems add_wzitem_info(#"wz_snowball", "wz_snowball", "unknown");
    wzitems add_wzitem_info(#"wz_waterballoon", "wz_waterballoon", "unknown");
    wzitems add_wzitem_info(#"hash_32c805d452b5f91b", "hash_32c805d452b5f91b", "unknown");
    wzitems add_wzitem_info(#"hash_1d9cd69d5981d2c7", "hash_1d9cd69d5981d2c7", "unknown");
    wzitems add_wzitem_info(#"hash_1b31f48b11bd3801", "hash_1b31f48b11bd3801", "unknown");
    wzitems add_wzitem_info(#"hash_7f6ccc550b17457f", "hash_7f6ccc550b17457f", "unknown");
    wzitems add_wzitem_info(#"hash_5af6760a28de557d", "hash_5af6760a28de557d", "unknown");
    wzitems add_wzitem_info(#"hash_6cfcc2143e6ee6ee", "hash_6cfcc2143e6ee6ee", "unknown");
    wzitems add_wzitem_info(#"hash_2c228a7b8b32e6b9", "hash_2c228a7b8b32e6b9", "unknown");
    wzitems add_wzitem_info(#"hash_3d4da55492286012", "hash_3d4da55492286012", "unknown");
    wzitems add_wzitem_info(#"hash_24234ca61e649d64", "hash_24234ca61e649d64", "unknown");
    wzitems add_wzitem_info(#"hash_735d22a674b7f8c0", "hash_735d22a674b7f8c0", "unknown");
    wzitems add_wzitem_info(#"hash_6bbeca41cf389982", "hash_6bbeca41cf389982", "unknown");
    wzitems add_wzitem_info(#"hash_2e486f8abfbeba49", "hash_2e486f8abfbeba49", "unknown");
    wzitems add_wzitem_info(#"hash_5cc9b5e23093ac03", "hash_5cc9b5e23093ac03", "unknown");
    wzitems add_wzitem_info(#"hash_15cefca07f84f894", "hash_15cefca07f84f894", "unknown");
    wzitems add_wzitem_info(#"hash_6a992c957fb327bb", "hash_6a992c957fb327bb", "unknown");
    wzitems add_wzitem_info(#"hash_34e069748d48b434", "hash_34e069748d48b434", "unknown");
    wzitems add_wzitem_info(#"hash_25b4ece6d3e0173c", "hash_25b4ece6d3e0173c", "unknown");
    wzitems add_wzitem_info(#"hash_73ba92c06ae7102a", "hash_73ba92c06ae7102a", "unknown");
    wzitems add_wzitem_info(#"hash_2e9b377396dcd11", "hash_2e9b377396dcd11", "unknown");
    wzitems add_wzitem_info(#"hash_46dd75a1a3f70780", "hash_46dd75a1a3f70780", "unknown");
    wzitems add_wzitem_info(#"hash_182fdef2ad243e20", "hash_182fdef2ad243e20", "unknown");
    wzitems add_wzitem_info(#"hash_212b01feaa916a00", "hash_212b01feaa916a00", "unknown");
    wzitems add_wzitem_info(#"hash_1abfcce0e9955057", "hash_1abfcce0e9955057", "unknown");
    wzitems add_wzitem_info(#"hash_665eccfe5d58f636", "hash_665eccfe5d58f636", "unknown");
    wzitems add_wzitem_info(#"hash_ff50c93155e445f", "hash_ff50c93155e445f", "unknown");
    wzitems add_wzitem_info(#"hash_394e9478cf4f8d9d", "hash_394e9478cf4f8d9d", "unknown");
    wzitems add_wzitem_info(#"hash_799f875c8f064a83", "hash_799f875c8f064a83", "unknown");
    wzitems add_wzitem_info(#"hash_3d82033b67579745", "hash_3d82033b67579745", "unknown");
    wzitems add_wzitem_info(#"hash_750be705a5c4201e", "hash_750be705a5c4201e", "unknown");
    wzitems add_wzitem_info(#"hash_332dd2a4956f495f", "hash_332dd2a4956f495f", "unknown");
    wzitems add_wzitem_info(#"hash_61d6c77ca964fa5b", "hash_61d6c77ca964fa5b", "unknown");
    wzitems add_wzitem_info(#"hash_1a79c2970ba8bf79", "hash_1a79c2970ba8bf79", "unknown");
    wzitems add_wzitem_info(#"hash_1b898a6e72d622d8", "hash_1b898a6e72d622d8", "unknown");
    wzitems add_wzitem_info(#"hash_5d35f83e51965781", "hash_5d35f83e51965781", "unknown");
    wzitems add_wzitem_info(#"hash_35f5430256d9c158", "hash_35f5430256d9c158", "unknown");
    wzitems add_wzitem_info(#"hash_5506836b90ed93a9", "hash_5506836b90ed93a9", "unknown");
    wzitems add_wzitem_info(#"hash_18e6f0326e75bce4", "hash_18e6f0326e75bce4", "unknown");
    wzitems add_wzitem_info(#"hash_43d8944b55b1e63c", "hash_43d8944b55b1e63c", "unknown");
    wzitems add_wzitem_info(#"hash_60ffe3aa992db93a", "hash_60ffe3aa992db93a", "unknown");
    wzitems add_wzitem_info(#"hash_b87a51e99e52b58", "hash_b87a51e99e52b58", "unknown");
    wzitems add_wzitem_info(#"hash_3aab463fff2b617", "hash_3aab463fff2b617", "unknown");
    wzitems add_wzitem_info(#"hash_25409de8d2edefb7", "hash_25409de8d2edefb7", "unknown");
    wzitems add_wzitem_info(#"hash_29a10cad59531d04", "hash_29a10cad59531d04", "unknown");
    wzitems add_wzitem_info(#"hash_4346f80fbf536799", "hash_4346f80fbf536799", "unknown");
    wzitems add_wzitem_info(#"hash_13ba73311ab5250f", "hash_13ba73311ab5250f", "unknown");
    wzitems add_wzitem_info(#"hash_3c9e4970b3140181", "hash_3c9e4970b3140181", "unknown");
    wzitems add_wzitem_info(#"hash_76aecc693bee59bf", "hash_76aecc693bee59bf", "unknown");
    wzitems add_wzitem_info(#"hash_1a3febc9dd2ff956", "hash_1a3febc9dd2ff956", "unknown");
    wzitems add_wzitem_info(#"hash_285b16162518c948", "hash_285b16162518c948", "unknown");
    wzitems add_wzitem_info(#"hash_44d9fdaac46214a4", "hash_44d9fdaac46214a4", "unknown");
    wzitems add_wzitem_info(#"hash_48e9d48bfecf8dd", "hash_48e9d48bfecf8dd", "unknown");
    wzitems add_wzitem_info(#"hash_166b2f213a373dba", "hash_166b2f213a373dba", "unknown");
    wzitems add_wzitem_info(#"hash_7017e5a5441c4da2", "hash_7017e5a5441c4da2", "unknown");
    wzitems add_wzitem_info(#"hash_69123f639841ddc7", "hash_69123f639841ddc7", "unknown");
    wzitems add_wzitem_info(#"hash_40103f4d2f71a6a7", "hash_40103f4d2f71a6a7", "unknown");
    wzitems add_wzitem_info(#"hash_695778cec905e59b", "hash_695778cec905e59b", "unknown");
    wzitems add_wzitem_info(#"hash_7be8f876858deae3", "hash_7be8f876858deae3", "unknown");
    wzitems add_wzitem_info(#"hash_6728f5fbe7b9eb60", "hash_6728f5fbe7b9eb60", "unknown");
    wzitems add_wzitem_info(#"hash_74cbb6df24a0f9bb", "hash_74cbb6df24a0f9bb", "unknown");
    wzitems add_wzitem_info(#"hash_250876d81f2e6f6e", "hash_250876d81f2e6f6e", "unknown");
    wzitems add_wzitem_info(#"hash_9dcbf9df7b19434", "hash_9dcbf9df7b19434", "unknown");
    wzitems add_wzitem_info(#"hash_6857c7a83fc6cdb1", "hash_6857c7a83fc6cdb1", "unknown");
    wzitems add_wzitem_info(#"hash_2799bb4fa8f20048", "hash_2799bb4fa8f20048", "unknown");
    wzitems add_wzitem_info(#"hash_e0a40edfec418ef", "hash_e0a40edfec418ef", "unknown");
    wzitems add_wzitem_info(#"hash_ac66bb9a3a19d91", "hash_ac66bb9a3a19d91", "unknown");
    wzitems add_wzitem_info(#"hash_691f420597727d56", "hash_691f420597727d56", "unknown");
    wzitems add_wzitem_info(#"hash_321c0010d0c7fdc5", "hash_321c0010d0c7fdc5", "unknown");
    wzitems add_wzitem_info(#"hash_363ed03cee79d627", "hash_363ed03cee79d627", "unknown");
    wzitems add_wzitem_info(#"hash_64f996475acdd244", "hash_64f996475acdd244", "unknown");
    wzitems add_wzitem_info(#"hash_7a53240a3664fe64", "hash_7a53240a3664fe64", "unknown");
    wzitems add_wzitem_info(#"hash_52d37104fb5e6eb5", "hash_52d37104fb5e6eb5", "unknown");
    wzitems add_wzitem_info(#"hash_1b69ed326eaa32c4", "hash_1b69ed326eaa32c4", "unknown");
    wzitems add_wzitem_info(#"hash_59da79c0dcf9cf76", "hash_59da79c0dcf9cf76", "unknown");
    wzitems add_wzitem_info(#"hash_21779574e3841392", "hash_21779574e3841392", "unknown");
    wzitems add_wzitem_info(#"hash_52083f0c0759df13", "hash_52083f0c0759df13", "unknown");
    wzitems add_wzitem_info(#"hash_48db4f35da313bd1", "hash_48db4f35da313bd1", "unknown");
    wzitems add_wzitem_info(#"hash_7dced4169cb1c6bd", "hash_7dced4169cb1c6bd", "unknown");
    wzitems add_wzitem_info(#"hash_6fbf66e753d55ddd", "hash_6fbf66e753d55ddd", "unknown");
    wzitems add_wzitem_info(#"hash_2a4214db930e08a7", "hash_2a4214db930e08a7", "unknown");
    wzitems add_wzitem_info(#"hash_1efebec8697e5720", "hash_1efebec8697e5720", "unknown");
    wzitems add_wzitem_info(#"hash_1caa1516c9ea66af", "hash_1caa1516c9ea66af", "unknown");
    wzitems add_wzitem_info(#"hash_199230a69a867bf8", "hash_199230a69a867bf8", "unknown");
    wzitems add_wzitem_info(#"hash_6d33368b7b126df8", "hash_6d33368b7b126df8", "unknown");
    wzitems add_wzitem_info(#"hash_32834da10f1048b0", "hash_32834da10f1048b0", "unknown");
    wzitems add_wzitem_info(#"hash_499748ba05372c7", "hash_499748ba05372c7", "unknown");
    wzitems add_wzitem_info(#"hash_40ced73804c1be81", "hash_40ced73804c1be81", "unknown");
    wzitems add_wzitem_info(#"hash_524268075ef65e1e", "hash_524268075ef65e1e", "unknown");
    wzitems add_wzitem_info(#"hash_1bfc7320c1335797", "hash_1bfc7320c1335797", "unknown");
    wzitems add_wzitem_info(#"hash_31c3a0cc51a512d2", "hash_31c3a0cc51a512d2", "unknown");
    wzitems add_wzitem_info(#"hash_1bd3cb5b4becaad9", "hash_1bd3cb5b4becaad9", "unknown");
    wzitems add_wzitem_info(#"hash_3063198fc139e3b0", "hash_3063198fc139e3b0", "unknown");
    wzitems add_wzitem_info(#"hash_2f73719d945fc6b5", "hash_2f73719d945fc6b5", "unknown");
    wzitems add_wzitem_info(#"hash_6c0eed50f4c26acb", "hash_6c0eed50f4c26acb", "unknown");
    wzitems add_wzitem_info(#"hash_19f93a4afe31c8f1", "hash_19f93a4afe31c8f1", "unknown");
    wzitems add_wzitem_info(#"hash_7313f9c02b023a53", "hash_7313f9c02b023a53", "unknown");
    wzitems add_wzitem_info(#"hash_237d7fbe80a5dd72", "hash_237d7fbe80a5dd72", "unknown");
    wzitems add_wzitem_info(#"hash_359c16f0ecf7fa33", "hash_359c16f0ecf7fa33", "unknown");
    wzitems add_wzitem_info(#"hash_108e6539e3886420", "hash_108e6539e3886420", "unknown");
    wzitems add_wzitem_info(#"hash_3cb0287b7a6acb0b", "hash_3cb0287b7a6acb0b", "unknown");
    wzitems add_wzitem_info(#"hash_59cfdb25a9e268d7", "hash_59cfdb25a9e268d7", "unknown");
    wzitems add_wzitem_info(#"hash_60d59d946f08ce33", "hash_60d59d946f08ce33", "unknown");
    wzitems add_wzitem_info(#"hash_6c6c011df03c8f18", "hash_6c6c011df03c8f18", "unknown");
    wzitems add_wzitem_info(#"hash_4e96ed69230e28a2", "hash_4e96ed69230e28a2", "unknown");
    wzitems add_wzitem_info(#"hash_371a6c5b25d41927", "hash_371a6c5b25d41927", "unknown");
    wzitems add_wzitem_info(#"hash_3aa75724345f7f87", "hash_3aa75724345f7f87", "unknown");
    wzitems add_wzitem_info(#"hash_47b346d1e63e6488", "hash_47b346d1e63e6488", "unknown");
    wzitems add_wzitem_info(#"hash_11366e8cbf37dea7", "hash_11366e8cbf37dea7", "unknown");
    wzitems add_wzitem_info(#"hash_36349aad8f680651", "hash_36349aad8f680651", "unknown");
    wzitems add_wzitem_info(#"hash_75142ec69bd0df71", "hash_75142ec69bd0df71", "unknown");
    wzitems add_wzitem_info(#"hash_29f4e28734c2613d", "hash_29f4e28734c2613d", "unknown");
    wzitems add_wzitem_info(#"hash_938a51cfa9e21fe", "hash_938a51cfa9e21fe", "unknown");
    wzitems add_wzitem_info(#"hash_1abd0375a9ba4674", "hash_1abd0375a9ba4674", "unknown");
    wzitems add_wzitem_info(#"hash_7bf2825f31eb6f0c", "hash_7bf2825f31eb6f0c", "unknown");
    wzitems add_wzitem_info(#"hash_36978e3a9321b430", "hash_36978e3a9321b430", "unknown");
    wzitems add_wzitem_info(#"hash_15f30a19a23c0190", "hash_15f30a19a23c0190", "unknown");
    wzitems add_wzitem_info(#"hash_7868873aabca7422", "hash_7868873aabca7422", "unknown");
    wzitems add_wzitem_info(#"hash_75c91bcbb2ac5f3", "hash_75c91bcbb2ac5f3", "unknown");
    wzitems add_wzitem_info(#"hash_75ed0988ff325bea", "hash_75ed0988ff325bea", "unknown");
    wzitems add_wzitem_info(#"hash_298f2c53101e30eb", "hash_298f2c53101e30eb", "unknown");
    wzitems add_wzitem_info(#"hash_38628762fb7c16eb", "hash_38628762fb7c16eb", "unknown");
    wzitems add_wzitem_info(#"hash_1114f950994a0ad", "hash_1114f950994a0ad", "unknown");
    wzitems add_wzitem_info(#"hash_154ee1cd494fed23", "hash_154ee1cd494fed23", "unknown");
    wzitems add_wzitem_info(#"hash_38406c9af972cfc8", "hash_38406c9af972cfc8", "unknown");
    wzitems add_wzitem_info(#"hash_44e8c54439fa37e4", "hash_44e8c54439fa37e4", "unknown");
    wzitems add_wzitem_info(#"hash_d06321f16576d1", "hash_d06321f16576d1", "unknown");
    wzitems add_wzitem_info(#"hash_779bd05ab23a8960", "hash_779bd05ab23a8960", "unknown");
    wzitems add_wzitem_info(#"hash_43aca7fcfd3e5949", "hash_43aca7fcfd3e5949", "unknown");
    wzitems add_wzitem_info(#"hash_5ab8d5a7f1052988", "hash_5ab8d5a7f1052988", "unknown");
    wzitems add_wzitem_info(#"hash_351539ca27808950", "hash_351539ca27808950", "unknown");
    wzitems add_wzitem_info(#"hash_7d4f218271a68cab", "hash_7d4f218271a68cab", "unknown");
    wzitems add_wzitem_info(#"hash_188b62566928d932", "hash_188b62566928d932", "unknown");
    wzitems add_wzitem_info(#"hash_50e8d062f783c1b6", "hash_50e8d062f783c1b6", "unknown");
    wzitems add_wzitem_info(#"hash_57193614dcdf4d44", "hash_57193614dcdf4d44", "unknown");
    wzitems add_wzitem_info(#"hash_7e1689892a14df96", "hash_7e1689892a14df96", "unknown");
    wzitems add_wzitem_info(#"hash_300632fdf0b9f295", "hash_300632fdf0b9f295", "unknown");
    wzitems add_wzitem_info(#"hash_74af73187bee531c", "hash_74af73187bee531c", "unknown");
    wzitems add_wzitem_info(#"hash_6c4a730e599b8513", "hash_6c4a730e599b8513", "unknown");
    wzitems add_wzitem_info(#"hash_383a7ee05d5b8327", "hash_383a7ee05d5b8327", "unknown");
    wzitems add_wzitem_info(#"hash_5dbe742451e190cb", "hash_5dbe742451e190cb", "unknown");
    wzitems add_wzitem_info(#"hash_6cb371d07db8ad2f", "hash_6cb371d07db8ad2f", "unknown");
    wzitems add_wzitem_info(#"hash_2c0c595e0e899af3", "hash_2c0c595e0e899af3", "unknown");
    wzitems add_wzitem_info(#"hash_213093d947c30be6", "hash_213093d947c30be6", "unknown");
    wzitems add_wzitem_info(#"hash_1a7edb90a484158b", "hash_1a7edb90a484158b", "unknown");
    wzitems add_wzitem_info(#"hash_300914db9caf4033", "hash_300914db9caf4033", "unknown");
    wzitems add_wzitem_info(#"hash_3074c41bb205ed8c", "hash_3074c41bb205ed8c", "unknown");
    wzitems add_wzitem_info(#"hash_2b06a3f530395182", "hash_2b06a3f530395182", "unknown");
    wzitems add_wzitem_info(#"hash_3e2adcfef9a6105b", "hash_3e2adcfef9a6105b", "unknown");
    wzitems add_wzitem_info(#"hash_743b859c2367ff54", "hash_743b859c2367ff54", "unknown");
    wzitems add_wzitem_info(#"hash_1242946e889704c7", "hash_1242946e889704c7", "unknown");
    wzitems add_wzitem_info(#"hash_745d80b3e4f28da1", "hash_745d80b3e4f28da1", "unknown");
    wzitems add_wzitem_info(#"hash_4cec712579f1202f", "hash_4cec712579f1202f", "unknown");
    wzitems add_wzitem_info(#"hash_5752a7e130ea202a", "hash_5752a7e130ea202a", "unknown");
    wzitems add_wzitem_info(#"hash_14b578e446580ad5", "hash_14b578e446580ad5", "unknown");
    wzitems add_wzitem_info(#"hash_53a2516ec1d3a096", "hash_53a2516ec1d3a096", "unknown");
    wzitems add_wzitem_info(#"hash_2b5027622c0b6d07", "hash_2b5027622c0b6d07", "unknown");
    wzitems add_wzitem_info(#"hash_57504010ce1814dc", "hash_57504010ce1814dc", "unknown");
    wzitems add_wzitem_info(#"hash_5e5f2ed57ac4601f", "hash_5e5f2ed57ac4601f", "unknown");
    wzitems add_wzitem_info(#"hash_2e8b13391f6544", "hash_2e8b13391f6544", "unknown");
    wzitems add_wzitem_info(#"hash_7e8c84081fafaea4", "hash_7e8c84081fafaea4", "unknown");
    wzitems add_wzitem_info(#"hash_4a2739676c12d92a", "hash_4a2739676c12d92a", "unknown");
    wzitems add_wzitem_info(#"hash_140318e970e711ce", "hash_140318e970e711ce", "unknown");
    wzitems add_wzitem_info(#"hash_4edf613e9b9032da", "hash_4edf613e9b9032da", "unknown");
    wzitems add_wzitem_info(#"hash_105f32560e2fb0fe", "hash_105f32560e2fb0fe", "unknown");
    wzitems add_wzitem_info(#"hash_50b970644e43947b", "hash_50b970644e43947b", "unknown");
    wzitems add_wzitem_info(#"hash_80292d121740f6f", "hash_80292d121740f6f", "unknown");
    wzitems add_wzitem_info(#"hash_45ced3880667df22", "hash_45ced3880667df22", "unknown");
    wzitems add_wzitem_info(#"hash_58c7fc0e9b3387bf", "hash_58c7fc0e9b3387bf", "unknown");
    wzitems add_wzitem_info(#"hash_3ccd209713ecb085", "hash_3ccd209713ecb085", "unknown");
    wzitems add_wzitem_info(#"hash_1f0f67f0ad9a766", "hash_1f0f67f0ad9a766", "unknown");
    wzitems add_wzitem_info(#"hash_5df4c523191c9bf7", "hash_5df4c523191c9bf7", "unknown");
    wzitems add_wzitem_info(#"hash_5d7898105fc6595a", "hash_5d7898105fc6595a", "unknown");
    wzitems add_wzitem_info(#"hash_568173e016d45c2a", "hash_568173e016d45c2a", "unknown");
    wzitems add_wzitem_info(#"hash_8578856a247ab60", "hash_8578856a247ab60", "unknown");
    wzitems add_wzitem_info(#"hash_6f80136c3b79d9e", "hash_6f80136c3b79d9e", "unknown");
    wzitems add_wzitem_info(#"hash_2e33ce38d6cda617", "hash_2e33ce38d6cda617", "unknown");
    wzitems add_wzitem_info(#"hash_23c6d9e19274be66", "hash_23c6d9e19274be66", "unknown");
    wzitems add_wzitem_info(#"hash_a1deb882d59a069", "hash_a1deb882d59a069", "unknown");
    wzitems add_wzitem_info(#"hash_43b78d5eff27f2f7", "hash_43b78d5eff27f2f7", "unknown");
    wzitems add_wzitem_info(#"hash_66023e3bee6c58a1", "hash_66023e3bee6c58a1", "unknown");
    wzitems add_wzitem_info(#"hash_2a10ad247a663aaa", "hash_2a10ad247a663aaa", "unknown");
    wzitems add_wzitem_info(#"hash_513a787ad3a20198", "hash_513a787ad3a20198", "unknown");
    wzitems add_wzitem_info(#"hash_38821d90f8209d05", "hash_38821d90f8209d05", "unknown");
    wzitems add_wzitem_info(#"hash_2b2bf36e2ea5ab8f", "hash_2b2bf36e2ea5ab8f", "unknown");
    wzitems add_wzitem_info(#"hash_7bdf38527a146679", "hash_7bdf38527a146679", "unknown");
    wzitems add_wzitem_info(#"hash_19c5c6ca805715e5", "hash_19c5c6ca805715e5", "unknown");
    wzitems add_wzitem_info(#"hash_5cadbeaa35cf0a4b", "hash_5cadbeaa35cf0a4b", "unknown");
    wzitems add_wzitem_info(#"hash_460aadea32c22c61", "hash_460aadea32c22c61", "unknown");
    wzitems add_wzitem_info(#"hash_559f58d5af0b432d", "hash_559f58d5af0b432d", "unknown");
    wzitems add_wzitem_info(#"hash_c4258356b038138", "hash_c4258356b038138", "unknown");
    */
}