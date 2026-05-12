Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D14872621
	for <workflows@vger.kernel.org>; Tue, 12 May 2026 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778544607; cv=none; b=uqPmpX7jKpt7DcdTJiqhoV4YzEis+EP1xmpbv7i1njtWg5HCoyUNPU3A33ivdakKdYpkNp26L49G8/3FRtsVp7l9yqeNclpdQWLhCmENE363bPYotgehRiyXiJhGV5W+gUTjYwbqshczw9u0au3b1Lpg4dx3efLBowGStFiEdTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778544607; c=relaxed/simple;
	bh=NpT5DDIgMZYXKfg64ziqp07ag88QIotugBwTmt5NXgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FVGEhZrmrgD1JeGFa1Uz20C2BgvoiVWMGN8d0FFBC4hjH4QnO/KqqtHw/SuSuqLoNg8GzJT3A5Cal+trRetF/hKQcAxFpGcxtGKj6Z93Hxt2HUSwf7+25EFDEhiCwaOwe5HY1sGzcTkrxyWLu6P71EJ++CsR1xoGBga0A3k7m3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcnvgJXn; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcnvgJXn"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-836ebdeb969so2259529b3a.3
        for <workflows@vger.kernel.org>; Mon, 11 May 2026 17:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778544605; x=1779149405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1KU/o4Rhfmxb0ycy3ieJw3/cjn7WafCI1izBYGYrMZw=;
        b=NcnvgJXnuVy3Vpx1aDaRXzb0Qnda96tEzikU+W0Yws61NIMh+Vk6QOgQSAAmsRSogz
         Bf+YyEeKnnGPm1F9TcQcjzwEc/DuT7GGnkXgYMD3KSPaWU3iKL8qlejZNtJZYu88m1kF
         aufgOdftTytGBNfwjPehwhS2VRfKDqnGgBdqt2zbH+SeMB53xCS+phBgioVAHmBG1OpN
         vF11dlIsl9qJVhgKXEmM3COoVqw7qiHaBjBd0+NXrwo80NaTAItmwcdqFY8ssH1bEs8f
         qLj24zMzF6cbd86nwr22SEtEWhKeXdtJ4pdQHLPCCWoWthJssp3GYaAIzR1q7TKTDt3n
         tNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778544605; x=1779149405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KU/o4Rhfmxb0ycy3ieJw3/cjn7WafCI1izBYGYrMZw=;
        b=mbnS4xzkEoWtN9bwaJPof/UKmbymisnRWzlZzomhcC6+mDFVfR8NWpkne4AjBtnjV/
         t6QUFWG4QKgVcLngIqMqaNmYgjxAcMpsjnakZG3Yg5lpEHhHxL5d/b5HWsWaXldN+Lzs
         GppfbnX2y8h2fSQO0Ik2r+SwGUu86ZqHphadtCbuEpUacgqoF/xSalBLfpxsTsoFlSar
         g32Qz2oT3u1mLd91cCoTO91elJHcdlpfqGw5mRAGkJ3NH+2ZWN7E57+2QUmdtA5VoYhl
         EtyYS43bGReeWZ7M5dL5VWukPWwE40z63uiSH6Kfai1cff9vi12Nc2VrFo7Y9qcQa5Hf
         l2SA==
X-Forwarded-Encrypted: i=1; AFNElJ/aomCpXhDcrmg/mo6u/pUYuEaP8hIKUQOxi1SoOgMFMX/UJkbeqxo894cU550p0/WoFw7gpna1tCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8QdhdiyKveaqxILxbNqj1kYDLZOvihB1dV+H8H0RDUuclwBoG
	n8hgUbmebVZw213w/1XaRz+EDdaKOmVkgsnLWATXxVZyosZ/xZTLoybeyY2ZRyqj
X-Gm-Gg: Acq92OELtHDJvVWhdR8PamtsuieGzH5ZctOsD/CHvkqn3vCHuXDMkJttnoqr2g0LJZV
	KgFLLpiDAiepP6dO8ZZlR3YloWSZ4z8r8G3yPoSlrgi+my24qqZvKrPZB9Z/dpAL51v5HfnVjjY
	q5mdtF7kTGLXpmVO515rdCHgjgUGKF0ICDYaKEF3LGuP+Mdu43i1kRZIWifjyu+dl+RI8ght1ur
	laGkvYA/QHsvGfaJ9JtLjjiQlJ4ee8z9RXsRGkiL2w4UOCG20sIw0EL94h8hLySo5L+gpjlD9vp
	aoi6Sv7hiVgnE/4OjjpBvvoJafv5zh4ufd7SGstmkar1RXJ8qZTdBJBkXcetHqyC/ms5zEwbkru
	QehSF40VcqQGyJEglOekJyeLQQCX+kF70Xt2yqz/4tV9J2Gh+YdxR/C4dlGqMZC0VUhFrGlsjOO
	GR37Py0/Abx4pdbyVOILbTUDcDE4JTTxnc1w0SdG4iJ5cX/iTzYHDLp+JtspRq5l3vCRyT47FLu
	x4d1pTIEhyG6xKejPUjO1wskvtz9a7vhysBC9pBcUaP3zE3xxDFl9x55HWAlBrAAg==
X-Received: by 2002:a05:6a00:a0a:b0:82c:8c6a:682b with SMTP id d2e1a72fcca58-83a5b9d81ccmr25161179b3a.19.1778544605381;
        Mon, 11 May 2026 17:10:05 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-163-225.dynamic-ip.hinet.net. [1.170.163.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c1bsm26123777b3a.34.2026.05.11.17.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 17:10:04 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] docs: fix spelling of Shepherd in howto
Date: Tue, 12 May 2026 08:09:44 +0800
Message-ID: <20260512000946.3234-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of "Shepherd" in the acknowledgements section of
Documentation/process/howto.rst.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/process/howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6f50..edf4412de112 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -616,7 +616,7 @@ Huizenga for some of the list of things you should and should not say.
 Also thanks to Pat Mochel, Hanna Linder, Randy Dunlap, Kay Sievers,
 Vojtech Pavlik, Jan Kara, Josh Boyer, Kees Cook, Andrew Morton, Andi
 Kleen, Vadim Lobanov, Jesper Juhl, Adrian Bunk, Keri Harris, Frans Pop,
-David A. Wheeler, Junio Hamano, Michael Kerrisk, and Alex Shepard for
+David A. Wheeler, Junio Hamano, Michael Kerrisk, and Alex Shepherd for
 their review, comments, and contributions.  Without their help, this
 document would not have been possible.
 

base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.53.0

