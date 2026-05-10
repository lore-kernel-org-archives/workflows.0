Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF31278161;
	Sun, 10 May 2026 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778432297; cv=none; b=ePh7i7LDhIeRN42Bw8VGHfKD8emFRfp01OhSgGX1rL9u7n7USfuof07e8zhzV602/BpOol0MjK0g3ANS3p1Aaa0tL9hbg41J8miOVtL1iD1NnbliCMZvPyj5mr1JzpmGzIjFqFVIh5mGyLDRTv9zWsf5k7ix5zIngOOZjc83MoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778432297; c=relaxed/simple;
	bh=YhgG1X4lV/gTlrPlXcEZ4guU1e4Awexbk6zW7TM+VKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyO4YfYz6iP+fCS1YWvC4lXHFTB2WkBD/tYz9cqK0MVXPT6xlCBxu0Fk7OZd4fpCw4hVp8qZ97MrKN1gRi1nuNAy9C85qjkz64Ox5hnf+rrFdjT+AzD4TqQu5B+1nPfx1hNcPxyN3CH+dGGWxxvu1XZVMAIGLWUcAX75t9EpKXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=F05rYaHO; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WDk9DTC5; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="F05rYaHO";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WDk9DTC5"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gD8F13BMcz9tSY;
	Sun, 10 May 2026 18:58:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778432293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=niYAJNRlns8Z9UZMhCLhpGO1NzxG0I/wvdlvfBDLzOw=;
	b=F05rYaHO2UeP+QBJ+rdlpbcspzleyzbd8kjv6fBNMNQDWnqXtRfC/30LDD8opb6a0LWFKc
	IIKA4CPMNnnP9+Z4foAklLzW4AZSt9aWJr3zRqMcp6wlwrMRKCjF362nCWjRQ+SUP9bLQj
	dERlv2HWMqPXcG619lxGxZnslKDjkgAPCjHhAuoX7DJ/h7Gr8divuiWRURWLCx1X/jwi8k
	2TjqkHRhY+8Q0nGdJamyF+LPCwbh/l0TmuKALLYMeIpHROA3KNAiOuFo7ZZz3JJUybYnn2
	9PyvzzTYeCwf61FuFVAzpNfXhNpcpqmtP6kpWZPma1ccKG5aDKOQoTh4lt4ZJA==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778432291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=niYAJNRlns8Z9UZMhCLhpGO1NzxG0I/wvdlvfBDLzOw=;
	b=WDk9DTC5Ae34mopGn5S5OMhJohmTCK74aYQ2LGtIUyH4ZKKXbHS7+1Hyc2r8oWgbuCyk5F
	dh7PCgcNqqFD3awhCFG75nwISTVIFBBDEiHGeJNudaPFMocDEoxI4Zual+X0axBcwQfdaP
	fa/r41czLlEHUMqGKqBCjDZXawMT+jM7f2Flwx2SQhVg5SUz8k+yBLF5BP85blVjIkLOSJ
	+W7YSpBslW29DdTgQEOFeibswZlZKOZMiT5pRKwyPI7WkR69Ptd+3DR6Lu0sq9ghr3MWoY
	DZi9iEDQFTGBbtMKcLbjuRO9+CqxRmRq8hfMUHoFKcaPxl7kThYh+U2EWkKTSA==
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
Subject: [PATCH 2/2] scripts: checkpatch.pl: add warning for strlcat()
Date: Sun, 10 May 2026 18:56:50 +0200
Message-ID: <20260510165649.57880-2-manuelebner@mailbox.org>
In-Reply-To: <20260510164907.57176-2-manuelebner@mailbox.org>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: muruocy79q58j37bwuhk1c7sdtwwcwr1
X-MBO-RS-ID: 1f9dc93d6bef1447112

add a warning for strlcat()

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0492d6afc9a1..ca1a8e67d529 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7085,6 +7085,12 @@ sub process {
 			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
 		}
 
+# strlcat uses that should likely be
+		if ($line =~ /\bstrlcat\s*\(/ && !is_userspace($realfile)) {
+			WARN("STRLCAT",
+			     "Prefer seq_buf_printf() over strlcat - see: https://github.com/KSPP/linux/issues/370\n" . $herecurr);
+		}
+
 # strncpy uses that should likely be strscpy or strscpy_pad
 		if ($line =~ /\bstrncpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRNCPY",
-- 
2.54.0

