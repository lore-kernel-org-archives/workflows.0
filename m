Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93506370D7D;
	Sun, 10 May 2026 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432194; cv=none; b=GCeWNCcsBvK8UDd6kkzQchkYTGMj683cdJrDc8/sLar5ExHfASTyTsOq5ruCvcrzl6sVcjoVKm6pYNQk5yr3tN72GYdEnLDySTbcwDUTHgEnVWFbVG2+TdQ+y9WoEMd7uxxmkL2wlhYkPC4yEva1fe5GG7W+Q56qTrPhBpRRbDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432194; c=relaxed/simple;
	bh=WLGJjL4gtWz4aeh599TmzMCBnQUHPosUXr1zLmflyWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpsxpCussAkzFREJGwQbWt4CEkAurWSe4Q+yiJOnAot1qS3OZ8BWgoPwQvg4kamuRROUC0DAqaO03pD7SauS6j+wiPX6AAYNI3epeGX7AH6yZRQdDco0VKeJxCUb8vVMAkSafjV/jVEAwcNWAFQkTxqsMa3SOvrp8nrEMQNqjNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WtRsM16r; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hBNRyXFw; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WtRsM16r";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hBNRyXFw"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gD8C13dCFz9v4J;
	Sun, 10 May 2026 18:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778432189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6U9H9It6s5PNBOTSM0ITXI4EJxod7/On7zf8/Flx0c=;
	b=WtRsM16rPKMh2Hu5P2a2WmAzLBwyJ7kbee38wDzuLyfd0SOY4/2nZatKqefVvQbg9wB5zX
	5uAo5SKf79CvYP5jPJMNl9kiYSKKHMfZiaHz3NA1MKftk3q7+y8qaoIjDYVgHbi5Dc8T4y
	/CQzfCtXrO5XcnEGOMIsHuVmq1rgmSSkLUmZbK45Qcy3qqRwU+6ZLU60BeCBy/u5pbNUT4
	Mn1LgNGbAgheic4JO8JRlQKlPH4N4A68Ds8ISa0U/KKdRLukuUh7VhHS/X5pdVBHNsluEH
	7v+1eEbznRXaVkEUK1rfdXba9kxL9tS2XuYAUgV/MsUCb75WkF8q89h8JSArPw==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778432187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6U9H9It6s5PNBOTSM0ITXI4EJxod7/On7zf8/Flx0c=;
	b=hBNRyXFwUDPKz6a/oIvgwuoGqkAocUPw/3y4EqkXem+9QUOEoGkZTNdsMwJOwg7JboT/q6
	8oHn83Hn85uRBpe56+uJ23qM0UKCfHlmcAX3yDXh0KyxIfyaAG8hhk1begTZZXfglH1h5W
	9TyTHl4Jyd4A0SqWEzyJrjcXN0/yGrMOuWxNnpMTs3LvTbX1F3TTuoiSwQwTSvdcUL3MU3
	Gb69DJVuCKBlEjWLh2a918csEaAtgE4YsoUv1W7vAvC7vYJh44/DFkOdozDvvaT42f3Rsy
	XsgaNMkIRni0orHgi8BUAtS6t4A28quTCmliNPFajtXdNozulZ5mueLzj64TmQ==
To: manuelebner@mailbox.org
Cc: andy.shevchenko@gmail.com,
	apw@canonical.com,
	corbet@lwn.net,
	dwaipayanray1@gmail.com,
	joe@perches.com,
	kees@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas.bulwahn@gmail.com,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org
Subject: [PATCH 1/2] Doc: deprecated.rst: add strlcat()
Date: Sun, 10 May 2026 18:54:52 +0200
Message-ID: <20260510165451.57674-2-manuelebner@mailbox.org>
In-Reply-To: <20260510164907.57176-2-manuelebner@mailbox.org>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: yzudd5mbf75sfruuu9od7rgh474xcx4c
X-MBO-RS-ID: 4c36ed6b1f9555b04d2

add strlcat and alternatives

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/process/deprecated.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index fed56864d036..b8a65c19796c 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe replacement is strscpy(),
 though care must be given to any cases where the return value of strlcpy()
 is used, since strscpy() will return negative errno values when it truncates.
 
+strlcat()
+---------
+strlcat() must re-scan the destination string from the beginning on each
+call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_printf(),
+snprintf() and scnprintf()
+
 %p format specifier
 -------------------
 Traditionally, using "%p" in format strings would lead to regular address
-- 
2.54.0

