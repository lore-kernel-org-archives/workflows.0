Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94F32B135
	for <workflows@vger.kernel.org>; Sat, 15 Aug 2026 22:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786831266; cv=none; b=GbMJqdMppTp7O3VQA/kYOLEJCxQ6zcLvy9d8tF8KrgvW8xs5BkrWNf/jiuCplMNlTd4pmvqTHuJ7NrwW118B8juj8IeZT66mErhrOsgZKJlZdhrtX1yklCLc1Nat1u/Bf+r0Fz0o46HNsByl79jeME235MVw3H2O7LBo255nuX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786831266; c=relaxed/simple;
	bh=PG4MIE2W12sOR4QIFtwBGIizXLfGQeSxCLRQu27ohHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+C1Be4ZwP2vK+QQ6qdI8sp+DnpKYRI/e4dmkTZP11FF3+LKCYj+0DbixRlCv2DhtK7DLWh8xMmW6f4L5LAFIsQh4C/hw/8s03LyTCR4hyISjx3//D47SNQOvcQas0XPHfREfeJXs5LtNBPjLzhsPGh9lfEb9vrSQ1prdLchps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhkeX786; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhkeX786"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49954b88fffso25165095e9.0
        for <workflows@vger.kernel.org>; Sat, 15 Aug 2026 15:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786831263; x=1787436063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PG4MIE2W12sOR4QIFtwBGIizXLfGQeSxCLRQu27ohHQ=;
        b=OhkeX786chHO3sGgDfGPEhOD0Eq0r54lWiYWLCnJlPmOGHTf+zRUpIhyJ2DQL92nwv
         TjoW7M0IP1Ed96i26IWG2+3XwT9knTpyf7ASjTYwfKyHMrxooAiWSRxL/n4GjJ6IiUjm
         pNFBDp0DAMExtFJrplWTIzpuOqLr5nyS+g28A8vHMQt6m7TXXu91OIqEfUfFqMlABg9w
         3g7Jl4w08cBk5ryV31wDguRzY+lHUQa/SGYO5wdPDerkIf6aFpyMKPOqNm3hux9J4Eio
         t79IbUa+jzLPkjK1QLfwh8hl/XU3230ZLZ8sGClIEQ8S7VA323hGb2bZOgnH+osTVR9a
         ZDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786831263; x=1787436063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PG4MIE2W12sOR4QIFtwBGIizXLfGQeSxCLRQu27ohHQ=;
        b=MAcZyUw8dT5kh256jdRB1c0ZvLQrcaxzlOt6AovNlt5+8pLi1zM6gDPdE893EdTSMP
         dlLU9QIu4XJvTvW6QiNyp82HeooaDAoHO9WNB/m/pOf955WEg0eC1ABBJkZhjrFceyqZ
         GXjPhdmVFgUAUTLBiueAEgpnAusvVuGDy/sxC0isqiRti1a3eRUl2cYcAujm5wxhmPKx
         zQko/Q0OhQ2GWXzMUah4MOaOVCL6J7lzwP42kwi5epwoGScb2hJXzADqLdijzDXAZR+w
         YrWXQbeb2FQirNTDKHVRKr6S6CbxE7MkIj729G1D52oamUntLpKVdodQeYsGmYOzKH1N
         J2nA==
X-Forwarded-Encrypted: i=1; AHgh+Rqy528EGLmZJ2pVjqLN1taPD4NbzMvqRPBPbMQE4fmM/JtiI6Uj9zRXO5GwmOpY8vanDFBXT7I3SOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdkbDHXmpYTqcz/yTEhGFOEiuSv3GuE4d9PnXKDOV2DvkSEDNn
	Ih78gnyLJlK9FTPylzgDMT59F1gBC2lNcJFjp28BTv7mz52DlTkzZfCI7U6OHamNp7k=
X-Gm-Gg: AR+sD12piu6DCIKxWTcrRxFEEptxNba0yiu1J/GdgbD0RSBrxdjmka3RCLtoah2099k
	VPUxr3XhiLQReinyUpHrcd6cGMJg8wBjBYKiHRn0X1QXuh508wGU3cahJu5Fd9w/SsizZRqOyJE
	ymlEK3h/lTs1hgz27iPlEW067gAvCYBryM8xU0M9fDkbn0/h3A8on1jv81AAriIgJPkBqrtsTrB
	rCrk/UuU5s63u7Ht/qOIfTlu41k33BIxekrjhvFO2l1S8BLGbYOq70ADtrf+xto9rK9jXjIIaIw
	7qOiug6Dpm/KCUX/NqtZlTQTxBUtwfF4M5Z3wZyCYb2pj2DzIezDcPzxWwq4SmqJNZFtO2xFz6s
	aDbpCNvR3gfFcIc3UAPL9zXLqmk1cTtKJ6t3YJan+tWlXYcX7Lel9UMTm3DieN7QxF/ziUk3dm/
	qBd/m5mxyrTXJFn/SNWQaJY6AuqyeU6rm6CyF0pVLcAM//ABvhwDvIljI=
X-Received: by 2002:a05:6000:4910:b0:482:9dc6:16c4 with SMTP id ffacd0b85a97d-4829dc6172amr3577280f8f.1.1786831263297;
        Sat, 15 Aug 2026 15:01:03 -0700 (PDT)
Received: from Gentoo ([191.96.150.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c1307sm20384790f8f.27.2026.08.15.15.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 15:01:02 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] Doc: process: Getting rid of OProfile url enlisting
Date: Sun, 16 Aug 2026 03:23:17 +0530
Message-ID: <20260815220029.3711742-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Aren't we done with this damn tool from a kernel perspective?? Thought,the link
could be removed.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/process/changes.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 0aa232b117b5..336c07190c9b 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -556,10 +556,6 @@ Ip-route2

 - <https://www.kernel.org/pub/linux/utils/net/iproute2/>

-OProfile
---------
-
-- <https://oprofile.sf.net/download/>

 Kernel documentation
 ********************
--
2.54.0

