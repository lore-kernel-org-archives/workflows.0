Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC08D2D23A6
	for <workflows@vger.kernel.org>; Tue,  6 Jan 2026 19:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726558; cv=none; b=IMo85SfFi2SPdeCJsedQB1/fgjXo9k2uiQkOcmE1myU6mCvLI9K0H1UgYQltAN3OF/81dkvgDWjyVOET2Y+BkCtrI8MIVY/cVrLkLoj/PpuznDL3ale08G2w4CCgpvjrPsYwqmNGmr3v5fM4XUyaOP+asP5YeoNvl8xY1Ix3Tu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726558; c=relaxed/simple;
	bh=crmmpgYHpa5RdbN9QfB0hv+JH6CpIsDGdNmwc5APkw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RG7FzKkj1iAKuBZzZytRgaXuedVYOlXSuir5XxOy5sbyitF+PPSyl3ctxw6znb4/TsWPFcpDDtWvG+dEJvBcFiej1ItPadponCruv2TwuoAho3ujHslCktOwmTvGh+nHUD55HNoMN3JZGvqbKv8FwB2rtl72noJytwLcXzjm7Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tne+Mzm0; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tne+Mzm0"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0a95200e8so9574645ad.0
        for <workflows@vger.kernel.org>; Tue, 06 Jan 2026 11:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767726556; x=1768331356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhwaSoSDcJzaU6emLiSJOWLUcyi9EjvkM7Ru1loqRjM=;
        b=Tne+Mzm0EcDycWrgVr1vsvjuuCdTRJeUxwp3g66Mq0PzgAmqVZr1VM+4MPsBgYC2VU
         AYcv4dV4qxwuk60eR4AUwBtOwoIBbO0YYiyvnYk6jBtf1FIh2T2bASZeJ1Qj8+0gdgwJ
         0zTOF8fHH2mbeSrkBntc2dPK9T5GqXo8BYu0/TN9fEeqFIYAA0sBOSMb34SF4dSPOMc/
         k9clHEoZ+8KO947ECZ8cwujHZU+7zFX/T0+GWkDyK0AM/7eX9rBA7hAQC1a+rjqfsL7l
         k8ssdXxxwosIBmkzmR2HPkuJU/TWgaRdCV7yo2Va9IJrf3Nko7D6y7fmh/LRIgQtIsCl
         5j2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726556; x=1768331356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhwaSoSDcJzaU6emLiSJOWLUcyi9EjvkM7Ru1loqRjM=;
        b=SJsTiucPnRlmBPoev03bygLcucs+jXSzOl/Uib99xI2Y2NJf5p/+4vzl4Zdx4eDJ1m
         6eD40iDSQI/IF6fuLLPKHXoBgzOD7aZ1EJgzwl6teII7aQUedImoC9rbtwGU4rn6mDED
         5BvZcZjxVlh4EwPrdHfdbyR6HtMHNl19q23NTqkYtVoBUHPgwFZi74Mzu+cVyNOeAu5c
         loY23bpRZQQ93JAGUNB9vU13cjq66JDBhUexNGMCTuo+nb0SMww4L4QnUKDL+5ly9+ew
         OMkpJrWvlGr6cLX7Dd5yfc45j5RVYN+exrRVFa7pm/OtwACQkQrpaV63JwpLeCaXN8EF
         xKAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUSy9ALsdPWTQZK+/VVqxkRZHNDP8j0U9kRrAMHkKANbrmVChWmOXKdOTSr9Y2pVBiEgSc0UJPbRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY4TtXuRp3CyEcolB1qoNnWkCgoo/NNWS0cpJhs19oMUCQS1zs
	IlrgohzN4s7t2epu0USG+sfTMR00yhftMmt1Joon/ZZ7uRb2OuI51Fo8
X-Gm-Gg: AY/fxX6umW60H0PvWvI3yGHOmTWI5ofm5I/SfVCs5i93igt8Zb/ufeOVgnDzhINZOn/
	MCvsvgvAVNtDmDnQEkLdVB7C/LJSZTE5HsB9uwUKm394GvF/pL63rrVTGcHwo2hfQBH77zpqW+L
	vKr2vVrnOHNIz9hxzo0LShKybeIzek5XSewHj4gjxnTyWreYFiFD6Ya+lHvmzrYtDptlnV32ChB
	oCWLG4sbY626+MSeUSau4iHw/+ZSde/LwXQRxCYFofL13G0DkpQz2uLo4++byBlqxVj0wtIIzwa
	ncl8En3MSRcwUcysPLHghwoZDY4n0WW2yNV2EsIYdQC9bV4Y8z1XvU095ZVRj/FrB+FILul2rIq
	xidxmuQT0fIbeN5beG7ZZC5cGP9KL/T99RU9uRBJUrHuY+DXLvoJ6EAosvkRmqvc6xQl6YPSpBS
	SLMMVrPznTzyCu3o3NFw==
X-Google-Smtp-Source: AGHT+IG/FutjzhU827sNvJPVoR5OnV23bzd0idPEqRV+0+0JnOaD0+CqzPWXI3rmEXY695v5Rtx7sQ==
X-Received: by 2002:a17:903:b45:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a3e2cfcf9dmr34016045ad.32.1767726556016;
        Tue, 06 Jan 2026 11:09:16 -0800 (PST)
Received: from rivendell ([101.0.62.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc78c0sm29380975ad.69.2026.01.06.11.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:09:15 -0800 (PST)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH RESEND 1/3] scripts: coccicheck: simplify debug file handling
Date: Wed,  7 Jan 2026 00:38:34 +0530
Message-ID: <20260106190836.36630-2-benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106190836.36630-1-benjamin.philip495@gmail.com>
References: <20260106190836.36630-1-benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit separates handling unset files and pre-existing files. It
also eliminates a duplicated check for unset files in run_cmd_parmap().

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 scripts/coccicheck | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 89d591af5f3e..2efb74afef2b 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -138,7 +138,7 @@ run_cmd_parmap() {
 	if [ $VERBOSE -ne 0 ] ; then
 		echo "Running ($NPROC in parallel): $@"
 	fi
-	if [ "$DEBUG_FILE" != "/dev/null" -a "$DEBUG_FILE" != "" ]; then
+	if [ "$DEBUG_FILE" != "/dev/null" ]; then
                 echo $@>>$DEBUG_FILE
                 $@ 2>>$DEBUG_FILE
         else
@@ -259,13 +259,13 @@ coccinelle () {
 
 }
 
-if [ "$DEBUG_FILE" != "/dev/null" -a "$DEBUG_FILE" != "" ]; then
-	if [ -f $DEBUG_FILE ]; then
-		echo "Debug file $DEBUG_FILE exists, bailing"
-		exit
-	fi
-else
-	DEBUG_FILE="/dev/null"
+if [ "$DEBUG_FILE" = "" ]; then
+    DEBUG_FILE="/dev/null"
+fi
+
+if [ -f $DEBUG_FILE ]; then
+	echo "Debug file $DEBUG_FILE exists, bailing"
+	exit
 fi
 
 if [ "$COCCI" = "" ] ; then
-- 
2.52.0

