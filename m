Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8405F314B96;
	Thu, 14 May 2026 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778776190; cv=none; b=eXkj8+m6Cag+EalX5PoCpVB9hpqrYL6BV6++7T44dBsNkecGxLxEeK3AWjwWvPtRFxvFlsun8diGdbq+8hzeZ8IEU6Ic/vAMyui81bGFIuERMJWqg0cM0/50dGlz1GjK++PjUJq+864xpRAJ92Ap1jeZQtRzBPEeJOMRIMsBnsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778776190; c=relaxed/simple;
	bh=N4I4F7exIEuEPOld5JnQ/WvRQPnxRw2aZDJ08Qkrqa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rv1Fbheb8q5Sq1u+0u3Vbb0quOfMmu0cEwdL3oE7sVzFAbv/KmlBwaseP91w2dR4+VbP15o/16DovDQbEWEFh8T7Qq7VooaI8GNmBBRyiouB6KHLZIb2OPv3pFJqTHD+StmXjL5jO43izkIbco5/q7tiTzWz+z8hMpp9plgDMDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XpF/Us86; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=e1oBiQTD; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XpF/Us86";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="e1oBiQTD"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gGbQL40xwz9tsf;
	Thu, 14 May 2026 18:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778776186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nT3V7Q0/PBLhoKcxHcZf/465dWwCX67tKOpGhQAmip8=;
	b=XpF/Us86VnN2n7HNXmqYVFs43DVen/cAMvQK1mehOBeKXgnA8aaEaAMwHax3qyJJgqAw3f
	ISoOnqVoH0AB9r+NNFiCejehH7jNpgPqyY7bprM2kUaKkMRiXt7Wl24pdEOUsDCNsBqiwl
	RgKc81QE8eD5q4FEUxX7GEcHolgPzKHyrfgIARDQKPolH84kWHLhxy1a2Jzf7dKvzqvasG
	rYCQn5TIpFJDoYGMdh8CwqQGPNiV7vnrql/elsa9pYn+pIS8nzIvQkotdQnxLuSfy1nwkF
	NiRxRQdu4jKDFMf2WaEla6/VVzFymibycaBtNLdq3MeyI1dOQ2BcKldDN5CGcg==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778776184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nT3V7Q0/PBLhoKcxHcZf/465dWwCX67tKOpGhQAmip8=;
	b=e1oBiQTDSBBpGle+kuQDRGwWegFJfHMnPukyXJRs426SoMwLYKewe7LvVIa6QSeTA/vMuj
	nwVi4pVwM+NsLK+v2J+vDxsAsYGtMMPpmIOMGoF1bPqLI5r7h5n7ccQacv99Vu4ynUy2YX
	CSrt5L1Pp9US60lKAEphUPZAWTD2xNB5/MbQgnGsWDj0n1Me2LeluIJPGBM5vfM73Zu7Pp
	jQdvdxhMSMyXAgkgocP7MTkz+lhxDQUKQpDh++4m1U9OWeg59ZGGBqQA8pEdTIWgObJsf8
	Rq6yFzoU1I+4Imq9ptb6SpKnU9973xVJInVUYjOEUf+px3PXIrepH0EScHI07A==
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
Subject: [PATCH v2 2/3] scripts: checkpatch.pl: add warning for strlcat()
Date: Thu, 14 May 2026 18:28:59 +0200
Message-ID: <20260514162858.107919-2-manuelebner@mailbox.org>
In-Reply-To: <20260514160719.105084-3-manuelebner@mailbox.org>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1jzrei5syh7ts419sek8pdyc456y4qex
X-MBO-RS-ID: 3da5c52ef4c6684c43d

add a warning for strlcat()

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0492d6afc9a1..4c1b43ebe00d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7085,6 +7085,12 @@ sub process {
 			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
 		}
 
+# strlcat uses that should be a more supported function
+		if ($line =~ /\bstrlcat\s*\(/ && !is_userspace($realfile)) {
+			WARN("STRLCAT",
+			     "Prefer a more supported function over strlcat - see: https://github.com/KSPP/linux/issues/370\n" . $herecurr);
+		}
+
 # strncpy uses that should likely be strscpy or strscpy_pad
 		if ($line =~ /\bstrncpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRNCPY",
-- 
2.54.0

