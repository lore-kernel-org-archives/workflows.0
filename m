Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3A8CD80CB
	for <workflows@archiver.kernel.org>; Tue, 10 Oct 2023 12:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbjJJM6j (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 10 Oct 2023 08:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbjJJM6j (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 10 Oct 2023 08:58:39 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACDEA9
        for <workflows@vger.kernel.org>; Tue, 10 Oct 2023 05:58:37 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4065dea9a33so54164555e9.3
        for <workflows@vger.kernel.org>; Tue, 10 Oct 2023 05:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696942715; x=1697547515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3SI4JY3DNx4EgaWZfWrgnEZk2q3gFyXvOUj+dz0SgUs=;
        b=PQJICYGIq9Pd7O9fr3EXpYt4HFwpC+C9TYO8qiQPfK394B0yYdGc5jLl5iX0Y3HaUb
         RnIvd1bQ5BWMv45y8VIMUZUTKVIqLMSGwENfXOc56s5ozu5ch5H1rDcQntmqO+Ss0ubL
         +W7sBbItWaQaSF/GqyDhrEz6l0OGqr8j14Dskr9iYlRHD3wwwsvQH9g2qMILCCs/VGsJ
         TEPl7WQjXqBT1VVkuFQ9SPCRBzl8oasRvD28pxtvD2XpeHAWJi3TfXePaAkNkz9z+4rL
         g+u3HyODnttp4Y8gtU3buXY922qAVRf9obBjx/Rh8UhCa5j2GgERJdMwTMWvM/pSxgLk
         GYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696942715; x=1697547515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SI4JY3DNx4EgaWZfWrgnEZk2q3gFyXvOUj+dz0SgUs=;
        b=F1oxAXodFPShsO2YZZbr2sBqQj5DphPMe+9kuIgyyhtcnXG/wklmKjaPRFSLefiy/5
         QGE0O1Lmqyx0+b11T/A12VUKC3NBwu4R5N0pjQh0xZ8mqZLQjn1gNm9U/oVJmAEzaZ9O
         DIsNXrUEnuM29N18zdUSC41ML5KwnmRyePPdztf2OfuhkU/+PKGX+WKUps3XqU9YytCH
         YFPQAhanN5eYsgEhQ3PjMRC4AZ/TzF6ARULUs9y7OGjmg2p4Uf8VWfWRvKs9eqtdinzf
         XY9pegEZcPQX6lzf1q7pd2VYpvxl8eRXHo89Gr+mrrLhXMXUD2IUKuO5+SMGFnMAuQpR
         M73w==
X-Gm-Message-State: AOJu0Yz9BCVahLD8FebWZxrbZ9iC6A/xT5MGyJbwV2d55EnfDvW+NIoz
        KxRfV3vMlgt1YVtYyk+qzGICEg==
X-Google-Smtp-Source: AGHT+IElBZy9MDfT+YhL3YBHroyxQz9Foj5QmxSxQkw0BYnxu50n7qEZA4PHtsNmMsdx8aYvIW5O7Q==
X-Received: by 2002:a05:6000:49:b0:32d:5cc0:2f0c with SMTP id k9-20020a056000004900b0032d5cc02f0cmr1091800wrx.40.1696942715517;
        Tue, 10 Oct 2023 05:58:35 -0700 (PDT)
Received: from heron.intern.cm-ag (p200300dc6f49a600529a4cfffe3dd983.dip0.t-ipconnect.de. [2003:dc:6f49:a600:529a:4cff:fe3d:d983])
        by smtp.gmail.com with ESMTPSA id z8-20020a05600c220800b003fee8793911sm14034296wml.44.2023.10.10.05.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 05:58:34 -0700 (PDT)
From:   Max Kellermann <max.kellermann@ionos.com>
To:     linux@roeck-us.net, joe@perches.com, gregkh@linuxfoundation.org,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Max Kellermann <max.kellermann@ionos.com>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] Documentation/process/coding-style.rst: space around const
Date:   Tue, 10 Oct 2023 14:58:31 +0200
Message-Id: <20231010125832.1002941-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

There are currently no rules on the placement of "const", but a recent
code submission revealed that there is clearly a preference for spaces
around it.

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

Link: https://lore.kernel.org/r/264fa39d-aed6-4a54-a085-107997078f8d@roeck-us.net/
Link: https://lore.kernel.org/r/f511170fe61d7e7214a3a062661cf4103980dad6.camel@perches.com/
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
V1 -> V2: removed "volatile" on gregkh's request.
V2 -> V3: moved patch changelog below the "---" line
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

