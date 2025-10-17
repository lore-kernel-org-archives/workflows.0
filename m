Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288822FFFAA
	for <workflows@vger.kernel.org>; Fri, 17 Oct 2025 18:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760724159; cv=none; b=E5AuCGgjrVO40sRya9WbjN23WFK0O+GN1XD4lVhw1TWJQvhxQTlv8plN+tjYL8jV0Tcv3a3uP+ZNFQgw57i80Un9TbboL/ban4q3YBgWUlPTVyGi9ggGojNieEcOIb53feskAjZbqQVLlSiDa+AHvrM5iYEV6OQfuwVXaNhpa84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760724159; c=relaxed/simple;
	bh=jwRvVCNYLGeSa+0leHMXF7EXzjGL8SPjU5bfAoQyeFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=unANbdvsxHifSDGCDb5nWooS7wwY3kQrM0xDrW6rQ1v5E5jqAa0k7xGQI0/v20MMyVi5CSCJ9vi4I7QS51iuwtILCtOt79/t5Zf8DHI73m9GGUdT/nNG0NC8sQ2ODKDfr8S7wm4Jt9dVaHbdSWl0cbqkzfqOVkKrL8A64pRnNaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=npRBgRq3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="npRBgRq3"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27d3540a43fso23776765ad.3
        for <workflows@vger.kernel.org>; Fri, 17 Oct 2025 11:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760724157; x=1761328957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ukAYWQ0T+S/AD9w3VhmapO1quF1wQBT8B5YkcopmuU=;
        b=npRBgRq3dkB+a1KVrRA/IjdAauC0zH/CrON+lsaBqe2S+v1U/f2DnAUjRupS95b+0s
         HQHqNO92ARYR97LAFks467282SHj2Moa+1crMV+J4Q14rMuADcsGJTDG+u8rmnGvVGyZ
         SkGy9hMu4MIJPwBn10UmdTR1hr3d04tL6hQiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760724157; x=1761328957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ukAYWQ0T+S/AD9w3VhmapO1quF1wQBT8B5YkcopmuU=;
        b=YX9FnyLntG5mxPtNQy1q7meUSyDwp39Cx0wxAvcvpldAkP2aHVTNNra4MRk9Awm0Ri
         4HQFdCTCQx9HJVwP8XrllRttkdVmYYG3s8t+mp/STTRWQz+2Ry76fooYFCd+k66v9d0x
         L1i7OFlsgL90mWfO/tAoJIoQvJXLPtWQYBVo5zFGgUaYAhdN0j7bnq3XOQu6s3ssQ4Hm
         q9j8AZQvtHY5VQx2kySveqPqz22OOYQEMV+SeFPsLZ/SvNmhBNxuUuB9gXZC/Tk8m098
         ovNNBctn5mA4W5NBHtGCc+/LS2AjmkPOaqOkNUiRwgdl2J0gvbm9PRpC/pwVrJGtsXiC
         mXcg==
X-Gm-Message-State: AOJu0Yy9MgGQ8F4VQDpIlrT67Tkx0+AkfFf3SoszuqE2SAwpxmw6+reQ
	hXXHf0OOW6RWLbPmT+DtF23BWpq6/FQIkZX7LS19Sff0mwudO9Dcehbzy2RIBJnNug==
X-Gm-Gg: ASbGncvOFXzlCuaw5UTV8cuNA98lvLDIYv0OFVS7NV9oN+YKr3PynbKqeALXVr1G4aX
	JN7GTJHXZY1xfoafZnnUNj+M7ae6Un6fLos9orfvyJIrQm9JFnmpB5KtXX3fx6xzxRXlxQXhQwx
	cU3aP0jbYg6DzHOFHzYmiEjmBKZ7Be4Em4jid891V4lvELiBSy7VPmkGYZwrDzzq+N9N4W9Ps0w
	x6+ol8deAfGVf0Uory0ld3m0fGFaxcIlw16xV9cE3SWTqBrXyzjGB8H6GF5WWey8Sb94Xtx+tez
	TUJm2lPp6EFchoGO3IJUz9jSFFTCmxY+7cmfwH5CIUcPv/0QAmqJQSuMfew9Lf4gsD1yuRCxbFL
	pi/cwYg4pf/JjJXtEColp3xllyYyAQrZYFn7gNS1rPo6Fkb6DCs/iCK15BuYClDNKh/rp7H8S/2
	kWoz5p7GgVXkheqJm9NsUMHKi0Y+EI7D9ki6RZTdQP54MO7N3P
X-Google-Smtp-Source: AGHT+IEY+KGbfcrrIWW9UFIVstpKYMq5DjhrzNx35qx3JyQw0vx6QrYeoAPZjdoiMrwc8TIfDGRpdA==
X-Received: by 2002:a17:902:ce0e:b0:264:befb:829c with SMTP id d9443c01a7336-290c9c8a738mr59262805ad.9.1760724157127;
        Fri, 17 Oct 2025 11:02:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5ca9:a8d0:7547:32c6])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-292472193c2sm1227785ad.104.2025.10.17.11.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 11:02:36 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH] docs: checkpatch: Align block comment style
Date: Fri, 17 Oct 2025 11:02:19 -0700
Message-ID: <20251017180225.1489398-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ironically, the block style comments in the checkpatch documentation are
not aligned properly. Correct that.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 Documentation/dev-tools/checkpatch.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index d5c47e560324..d7fe023b3080 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -461,16 +461,16 @@ Comments
     line comments is::
 
       /*
-      * This is the preferred style
-      * for multi line comments.
-      */
+       * This is the preferred style
+       * for multi line comments.
+       */
 
     The networking comment style is a bit different, with the first line
     not empty like the former::
 
       /* This is the preferred comment style
-      * for files in net/ and drivers/net/
-      */
+       * for files in net/ and drivers/net/
+       */
 
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
 
-- 
2.51.0.858.gf9c4a03a3a-goog

