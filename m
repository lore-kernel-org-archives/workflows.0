Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F3DCD80BD
	for <workflows@archiver.kernel.org>; Tue, 10 Oct 2023 12:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjJJM3m (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 10 Oct 2023 08:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjJJM3l (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 10 Oct 2023 08:29:41 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A0BB0
        for <workflows@vger.kernel.org>; Tue, 10 Oct 2023 05:29:40 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53da72739c3so461858a12.3
        for <workflows@vger.kernel.org>; Tue, 10 Oct 2023 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696940978; x=1697545778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jm0Gkyd6mOddFVe4MdtLBK/9SE+KlfPVDbiFP/AnFlE=;
        b=YB0R7VXEEuVCr7Z0Q7YgoXj3D2rEEsI9MKhrOnD1mIFYRpcblkw3aDATdotFdJSANA
         7zN+NSIEZnDdvACgb14XP71UECVN45TF15F0vZoQ2cP2uNc0MwzophWdJbhRpJG2qV7/
         Dnj4II+LcYfVn0IqtoJg3/F8PY8MgBao9nWayLYPfzLBK/4UtQyWcV5kYOycttgkymOc
         sHayPaHIcmnTXobQlik72CM7QVNKwKFa6/oYdOjjApIg/SNC0LMiDA0CHmdiIKKduTa8
         k89pR27/urQmEAWcvCuK7uyqZ/Bd3cMbm8pWwmzF6IdX5AduVoAnK5l9+Km2IoR8fHtQ
         tRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696940978; x=1697545778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jm0Gkyd6mOddFVe4MdtLBK/9SE+KlfPVDbiFP/AnFlE=;
        b=lR9ocN9TxyBY64d0NaxEW9IfXwQC3rLSRepIi2grW1qEPFzLIo32K9dFYODAVZCUif
         NGyY/DFwrJzFR0n25PB/YJ6VsjKZFTUtXyRwwq2qGabgNRGcwcmncXGuDuYJ+NvlUIRA
         +R9buc3PmV2WilvZ1laK+m3uxqSkXR3+tFefTdZtPqC+buquSJaWKURfNIevy8rVeNQA
         eaBtYWiH8i1h3NS/zGDwwYRdhYMCX4SJ+u9jSONPOpLcu9m8g5XH1pEg1uDgXmfBvjAI
         qCdMOqNvGI6ptRYowf0YGSXezmkrLmRxzoMJLT8/qb7W67+2EBNZ01PG0YHOo57Vm1CL
         HuJA==
X-Gm-Message-State: AOJu0Yzb1F5ZoSXD5Gnr9RQiu3HDI1t/kN7Kqm0Lmjgl8SeWxt38swde
        ce3zYybBPr7KMsgHV6WC94PC4w==
X-Google-Smtp-Source: AGHT+IEKB6pU7ZatL05bB5f+HE+iCVGM13Oam7xtiDsdcypxKuhLhoTmqeruuq4C9U7NKt4PBca4Cg==
X-Received: by 2002:a17:906:209b:b0:9a9:f17e:412f with SMTP id 27-20020a170906209b00b009a9f17e412fmr19625321ejq.50.1696940978520;
        Tue, 10 Oct 2023 05:29:38 -0700 (PDT)
Received: from heron.intern.cm-ag (p200300dc6f49a600529a4cfffe3dd983.dip0.t-ipconnect.de. [2003:dc:6f49:a600:529a:4cff:fe3d:d983])
        by smtp.gmail.com with ESMTPSA id lf8-20020a170906ae4800b00992e14af9c3sm8480689ejb.143.2023.10.10.05.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 05:29:38 -0700 (PDT)
From:   Max Kellermann <max.kellermann@ionos.com>
To:     linux@roeck-us.net, joe@perches.com, gregkh@linuxfoundation.org,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Max Kellermann <max.kellermann@ionos.com>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] Documentation/process/coding-style.rst: space around const
Date:   Tue, 10 Oct 2023 14:29:35 +0200
Message-Id: <20231010122935.999586-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

There are currently no rules on the placement of "const", but a recent
code submission revealed that there is clearly a preference for spaces
around them.

checkpatch.pl has no check at all for this; though it does sometimes
complain, but only because it erroneously thinks that the "*" (on
local variables) is an unary dereference operator, not a pointer type.

Current coding style for const pointers-to-pointers:

 "*const*": 2 occurrences
 "* const*": 3
 "*const *": 182
 "* const *": 681

Just const pointers:

 "*const": 2833 occurrences
 "* const": 16615

Changed in v2: removed "volatile" on gregkh's request.

Link: https://lore.kernel.org/r/264fa39d-aed6-4a54-a085-107997078f8d@roeck-us.net/
Link: https://lore.kernel.org/r/f511170fe61d7e7214a3a062661cf4103980dad6.camel@perches.com/
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 Documentation/process/coding-style.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 6db37a46d305..71d62d81e506 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -271,6 +271,17 @@ adjacent to the type name.  Examples:
 	unsigned long long memparse(char *ptr, char **retptr);
 	char *match_strdup(substring_t *s);
 
+Use space around the ``const`` keyword (except when adjacent to
+parentheses).  Example:
+
+.. code-block:: c
+
+	const void *a;
+	void * const b;
+	void ** const c;
+	void * const * const d;
+	int strcmp(const char *a, const char *b);
+
 Use one space around (on each side of) most binary and ternary operators,
 such as any of these::
 
-- 
2.39.2

