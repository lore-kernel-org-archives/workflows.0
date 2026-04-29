Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B09435AC1E;
	Wed, 29 Apr 2026 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447663; cv=none; b=ZZhiYsZ7EFZTr199u9y8F4N1UVI4lWSX3gQSaS5YQaj6UkWC75xHiKweD/ZGschx8tiZv8jQZcqLir/H0cKauVidpKuXnBsl4+SKAm50eViLFxuPhodR5NFwTACNnMyEUcRSylEs6W/4JnatWeBoj/KW4I1bsITPYBPCTflT/jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447663; c=relaxed/simple;
	bh=yPa8CaBk+GyPiGDRWKU9KNKIpqM64UXXp09VWNC0sv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FN7sETq1m/bIRX66FetRcV+ZIOQpDZCJ59SVRCXrhC0TokBXtrl4JdxYG0iNt7xAy4jtG1In0/r40nzZ5GOHX2f7bCez86N6KZLst/1Kqz75SWrqijWPm8vDOYmoECB5wXhIwDST9TWvke1BXqeyIQQBwxtPk89WpuhaPIKcz1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KZJmf8mi; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ph/AGL2V; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KZJmf8mi";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ph/AGL2V"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g585l2TXQz9t4r;
	Wed, 29 Apr 2026 09:27:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777447659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyvqRSJSM73q2bj8SRnjn1jgWkm+YanSrvLR5MkSDLk=;
	b=KZJmf8millWJRx0w9oer0vD9Ui6ca81VwWTXAA30WK1rGq/2dNY7LxlVrS05PJu4FXtTBM
	aofBbgOsQ16jDPbmdsh5tQ3JO/2IgVdwO5ogNmf57b42XwcnU/7StnvM9wMQIHrPXZnDPm
	dDfEToYsFIBnuAio0Cl8nFj3k4pHO5BJRJZGIcZJB1hfNQm6HhxXSFsgnu/2JevHys8Tsl
	l7PS4k6l3ZvR2j7h26/TScHhfaLHu/B/q9gM3y6f2k8/4f+j8+VBenazkInH0mYGISyV1M
	a89Gs0eEK//0l7YJE86TdiC8BlbagOkVXBT1FlQr++vIATtWP9G4J0hBf92TaQ==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777447657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyvqRSJSM73q2bj8SRnjn1jgWkm+YanSrvLR5MkSDLk=;
	b=Ph/AGL2VBQ9Sqg8b37oLd04HHK3L0jfLdUIXiq76BjAN7Qiv7SeVYzxwWmW1XTk9uFGKEG
	2j4N2RZB3LVajAxzxXL8GeWrpgxZI4Z/odt639rN8mtsN0M2NppScWeZ+tJ6I6rXNxnYV9
	GozinWKyDqR5SSCU0EZ/L+Uvg/Am+ChGgNhCVfs0L6Vwfy1wODi+8FDUvmgTc9cV1pdJe/
	n5NOAXTEoSZ2DJ/WImLAKl2iOu32MkcgVs8xbhG57v7OHiOu8ysnZnHR/bJu8AExnqoCNn
	KoaSDSAzZuo6K+cWJQ+LrgJcEfKFfUtWDfteSnuCsqNIfR3dsedfI9c3Hcd+7w==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: workflows@vger.kernel.org,
	linux-mm@kvack.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v4 3/3] Documentation: deprecated.rst: kmalloc-family: mark argument as optional
Date: Wed, 29 Apr 2026 09:27:04 +0200
Message-ID: <20260429072704.311603-2-manuelebner@mailbox.org>
In-Reply-To: <20260429070759.309110-3-manuelebner@mailbox.org>
References: <20260429070759.309110-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b04ec1542f739eb7150
X-MBO-RS-META: 89orio9eoe4yn574r1rzwrwkhunkhbee

put the optional argument (gfp) in square brackets
add default value = GFP_KERNEL

eg. ptr = kmalloc_obj(*ptr, gfp);
 -> ptr = kmalloc_obj(*ptr [, gfp] );

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/process/deprecated.rst | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index fed56864d036..ac75b7ecac47 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -392,13 +392,14 @@ allocations. For example, these open coded assignments::
 
 become, respectively::
 
-	ptr = kmalloc_obj(*ptr, gfp);
-	ptr = kzalloc_obj(*ptr, gfp);
-	ptr = kmalloc_objs(*ptr, count, gfp);
-	ptr = kzalloc_objs(*ptr, count, gfp);
-	ptr = kmalloc_flex(*ptr, flex_member, count, gfp);
-	__auto_type ptr = kmalloc_obj(struct foo, gfp);
-
+	ptr = kmalloc_obj(*ptr [, gfp] );
+	ptr = kzalloc_obj(*ptr [, gfp] );
+	ptr = kmalloc_objs(*ptr, count [, gfp] );
+	ptr = kzalloc_objs(*ptr, count [, gfp] );
+	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
+	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
+
+The argument gfp is optional, the default value is GFP_KERNEL.
 If `ptr->flex_member` is annotated with __counted_by(), the allocation
 will automatically fail if `count` is larger than the maximum
 representable value that can be stored in the counter member associated
-- 
2.53.0

