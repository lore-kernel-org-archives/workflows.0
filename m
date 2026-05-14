Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F00D316189;
	Thu, 14 May 2026 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778776343; cv=none; b=ZkTgWgWxCm2Sm2liUK6BOsNkjCN975xHAlyZRkLdOdRKHJK84vWgMIO0ZjGeKDK9qnnyK1JibhUZr0tx06w6JxgmsdLWu315pIygRK9Fk6I5fih7fUXzuXsPIa1SH32Ms26V2z1Z9NbHxAPGcl/1QFQ2vAdr3O54vKpAkqVZzzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778776343; c=relaxed/simple;
	bh=szoEGNrlBJ1LmQeDYolT3AAJQsNm38AgeFz4jvHb5/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/EEcPMcxTOXqrKBv358pQytTNayLdyF16Qh5aUHRdWw1qqaXlljK40O6k1SDIUA73MEGuzJAxGl9It80pACOs9u5IZF/xNtkbidnR2e9BSIKLK9K8KVelyAebgV5oUHDpFWpxZNpYWQGMjL/gzWjA6Ndpaev+wZGqcDyUIqCUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VMWQCvYK; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tTbnCPqi; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VMWQCvYK";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tTbnCPqi"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gGbTJ1N4gz9vDd;
	Thu, 14 May 2026 18:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778776340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oSTZX/Nl4yJO2d5YuuigYg8EBLAOIxbQfoWFH41gpEE=;
	b=VMWQCvYKG3Wv51ppxm8fHLU3KZD/hjsQB2k9xTbHHITAU+J2p28gg9Q1/vgTyZwZxSjwLr
	GKs9MiStYjYkmileJx0X0CNO9/2+X5kjV+ItiA5TWB7onfxsuPwps41g1PZQJgAF4TiBgp
	Bl87maHptHSuyQFFR99sEMVmmLwvxDyVbtlO8Q1V29pp5360xyNHd/cvmVOL/JaChIHYiX
	FBWXA8wKb+Yq0xmuYpkiDaTo900XyTsZEZqmsdFQQ1kkxlUOc1dGzynx32vppVOvXk/4Tv
	6FUwf/4Y2Bakqe8GSC0PU3iyEco5Xk8KJhmM9AnIC0tzLeDmFUiOtGpOGkMi/A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=tTbnCPqi;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778776338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oSTZX/Nl4yJO2d5YuuigYg8EBLAOIxbQfoWFH41gpEE=;
	b=tTbnCPqirFTqHrrBjR0Zt1etM9peSjaDGnDfNoKHS6TF8ySRa9ETc/7bN5cuB9goNNKviC
	4Kr27n6Y8tFAJChaLfwagLd0gjnK+hEy1H4c/jMip8LysK92VAm8SIdwLA7wmkwnrAOKps
	rQwtH3XflfgKstoXEY83SCSYNYSMHYAmTVG0/NogM/pLbtaKNSYnxsTKHNQYvEx9u0z8QP
	4RRQYx91y4vgoIkV3E8PpY7Ija0m5STgtvpRFCpf8gnqn+Qdbifa4dezdem/7XJqmgErpF
	iH4NTNaHiYN3U2T51gpzirqc2q/egInJGWkbCAzEJn+pBlRcmSX2zWtwR0v/xA==
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Laight <david.laight.linux@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
Date: Thu, 14 May 2026 18:30:34 +0200
Message-ID: <20260514163033.108009-2-manuelebner@mailbox.org>
In-Reply-To: <20260514160719.105084-3-manuelebner@mailbox.org>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 69646e659f84f55dfa2
X-MBO-RS-META: 8zocm5d1yzxojme1h5f5m63crjw9u7m1
X-Rspamd-Queue-Id: 4gGbTJ1N4gz9vDd

add kernel-doc comment to strlcat() function definitions

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 lib/string.c                  | 11 +++++++++++
 tools/include/nolibc/string.h | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/lib/string.c b/lib/string.c
index b632c71df1a5..0a44ca5ca7e6 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -249,6 +249,17 @@ EXPORT_SYMBOL(strncat);
 #endif
 
 #ifndef __HAVE_ARCH_STRLCAT
+/**
+ * strlcat - Append a string to an existing string
+ *
+ * @dest: pointer to %NUL-terminated string to append to
+ * @src: pointer to %NUL-terminated string to append from
+ * @count: Maximum bytes available in @dest
+ *
+ * Do not use this function. Prefer building the string with
+ * formatting, via scnprintf(), seq_buf, or similar.
+ *
+ */
 size_t strlcat(char *dest, const char *src, size_t count)
 {
 	size_t dsize = strlen(dest);
diff --git a/tools/include/nolibc/string.h b/tools/include/nolibc/string.h
index 4000926f44ac..1a4b51135705 100644
--- a/tools/include/nolibc/string.h
+++ b/tools/include/nolibc/string.h
@@ -208,6 +208,17 @@ char *strndup(const char *str, size_t maxlen)
 }
 
 static __attribute__((unused))
+/**
+ * strlcat - Append a string to an existing string
+ *
+ * @dst: pointer to %NUL-terminated string to append to
+ * @src: pointer to %NUL-terminated string to append from
+ * @size: Maximum bytes available in @dst
+ *
+ * Do not use this function. Prefer building the string with
+ * formatting, via scnprintf(), seq_buf, or similar.
+ *
+ */
 size_t strlcat(char *dst, const char *src, size_t size)
 {
 	size_t len = strnlen(dst, size);
-- 
2.54.0

