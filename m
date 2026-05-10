Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD8A3368BA;
	Sun, 10 May 2026 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778431953; cv=none; b=BBRlAvvoRGY833txvhobwx4bQ/xkX8TlmlqSE44rtYZZOfW9j74FaukFC6MKaF306hUIxdk3zARbNIl4JN+zysJRcxanSwC1YAst9Pq5Qa3i9gu7gmpFo/zUATH3CPAtS5xS1s+7t8sQcdcKZxNBfhCL3IElL3ij5cc0YEchE9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778431953; c=relaxed/simple;
	bh=wiIeIcOQqxdmtsDtrFD+oro9YJMPUlQ+qWVDhoQ/OVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=anYKI9jPjp07a7qZra6Vtd6J+pnAsaEBH+A1gwDgAgZK8/4ZewznPe+HpJ3+wdj0PDsxYQjFyvIbh0cb6tc59jMEe4Pt7cMNGYuR29qXLseBTHTXyu+ZyLunXpE9xR6OiA3ZS7JXqAkfXYagpeNtcZU/FlggbvHqlG1vc13UAAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wWi9LBL3; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TUQAvQVy; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wWi9LBL3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TUQAvQVy"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gD86N6FPSz9thj;
	Sun, 10 May 2026 18:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778431948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8GSSCXI5EnlIoJFugOYHFcXnSvKg0zMGeGDNehY3WJY=;
	b=wWi9LBL3nSsiux9u9rpXbC0J+5K45rEr45Ibq7iv6GFEFkVR5MwaqEpbNxSE6BDYSzZKro
	Brai2ddWqckv17lGiJX36I2eIgqNUhRDv/wqMc6SkRckLcvMfmmP1NQ4dn092zDIZiybHS
	7lctiarCfHvoLzatANWpHoBs4bKsYXpDez1i7WUcqCzcZ3aNMilwmnsZvSrFeLdyrHbxDZ
	7ktbey7mZ+tGAjwXNWMPuQikJhg3EzKHWEop9g11rEOs3g0I5PRY6fEU5AYm+mZ0y2+zvQ
	sURXlAMVuUB7BEgmAKxB9cXLI9s9oNXNdg93WixpdxqouOQMmpqjaUpEGQKZRA==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778431947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8GSSCXI5EnlIoJFugOYHFcXnSvKg0zMGeGDNehY3WJY=;
	b=TUQAvQVy/ns5b5rTtiODvuWno6JagPbluAmXhHgJra8bjGHvKH0gGxLKdZHfN7Se8T/zuT
	r/JW4VbBEmWBpbAff3rT3FfU+pUN1NuBvNHn1yOUIIVrJRCi8SxiggqHCdZz0aLCU+KUwR
	4Fc1sYWsmyQjuQJQh3ukD7/YKwD8XmyFFT6rupfOtzvC92YeWaCJnfCJcIxvKxuTmu7eqZ
	ckfjULvpMMPsafrEJbb9I0XY/nO+yATINEgzF1cJobw6fa0rWBzlnfXj0+y7o42boobDmF
	W9HqjJqDcMS/7mnxZQBfKoUW5kNKuonm34jmSQXgMdTf9+88hLudYgo3b/Gx7Q==
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
Subject: [PATCH 1/2] [PATCH 1/2] Doc: deprecated.rst: add strlcat()
Date: Sun, 10 May 2026 18:52:00 +0200
Message-ID: <20260510165159.57457-2-manuelebner@mailbox.org>
In-Reply-To: <20260510164907.57176-2-manuelebner@mailbox.org>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ag1gcwrr5b5a6d6gwbje759n8dhmx3mb
X-MBO-RS-ID: a84c73c5381c265d592

add strlcat and alternatives
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

