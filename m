Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BA11ADC7E;
	Sun, 24 Aug 2025 18:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756061430; cv=none; b=UzlAAzPKDsV6qA/7GcRtEhTF8edeb3bbNMfISKTs0RvIHqsdGZakNx38PKiEte75peQDGZ8ofN1s1m/D+/Cx1GvvonWqnmHk9KXbEt3An5JVxJwBzG+x3ALEmA4iqq3kNrM58OpMNeRQOIHrak0a23VNW/A3NMsBsnLe+lvnL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756061430; c=relaxed/simple;
	bh=oYpP+l0GELDk8EqZlQHXsfhR+LdmE+vBQmoVZbqoVkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N6FQDP7MIrnGw56vnxjNqvSnLtJpStMUjyoch3hlDkq1ZKeHSIe+qSCkcMnuQrkYasWYYxKmqANo959g09eVf3y67gIdUDrmsD1M0OH1TYVA8odz/GWlSzYIqN4bL834F6WWon+OFCEHd6uLj4rj3l2Vm2Qzmk+gfK94pTuCZ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoNr1NB/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoNr1NB/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2445805aa2eso31604285ad.1;
        Sun, 24 Aug 2025 11:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756061427; x=1756666227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e/I637rsQSBPccqVsWEHcQxSAsaIwGXkuxeMNEVZ+Gw=;
        b=NoNr1NB/FWg3cxMgVMENyBG+lqq97A7HbaL7eTUN6szox/IB/vx+29iUZusUzpik7h
         jhT+TIYjCVvqtQgAWpnFDYm9PTDTRdRRINksUN7ggRH2I9aZO/gdMLjpPMwjEQclfdWQ
         m2YPXW7DlRZNiq9i3F0n+CDlVaj7HiO4BMNtiF8HyE99MK3Jgy/yRmSSI5/1rLdgrJYz
         cqqMqfCuf3k2WHlC1DENORFguyKswt8eoW1l6iuZ9EO2gMPov/+wt3owqq9J+SEwS9hv
         qiW3FYQq+do4ZzYq3BOz3YZ5EZ7IU+izQATCqz4Ldqr1BpTpYAkZCMMIxHKr/7a6ZKbX
         OdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756061427; x=1756666227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/I637rsQSBPccqVsWEHcQxSAsaIwGXkuxeMNEVZ+Gw=;
        b=YzRxFnOM46jLyisdmGJx0MYQERvceTffSGMKf8R9DyeKk+S5UjHXrBFxkHdjWMKmwT
         PgTx2mF9rTYU96fZZPIjNTnJh6HGtueT6jtgBXmGG+ikc+hx6TXuyCVO5u5ABVbPatDT
         eV+659URER7y6att2Q0FU7z5BJsg2qUVLEjXuMeVBOzS0lEUpON6XCoWv6s9Au7nPfZH
         Uu3kKZ8SMdHjb8nASr9RPU+c4knvcTDOa8x+CP2tZZOO4CpY8zOZN0AKe2+tTkYVOZnP
         U6vmn1pcSyDHDImBUqhIpZUUazI0UOEwwo8DIZSlBoZBN4VQBSRrceCk46HDS9X63kkV
         pxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO8bSLucx7yUacH41krcHX71uy5WoOG8gYJGJU4C7mpSMhVjOWdav41j7lL5GY394+ZhzD+L4nlJc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+/Pm87+bhHUkg5oNi7tL8UQ1QZOI5dBzNb6NrStQuPSEUDK81
	vesqrOhE1on+MPaLwe2Ntcv+m3sMlQFaQ6HAjafs/Q0u6zBYMAEGiTxG
X-Gm-Gg: ASbGncshwNiRb85u9Kw/uTnYK9mvQnCh/B0Y0ONY3rtTR50fB3W7NNJXT8OzPfkm3Pe
	BWKoa5mBqU8+QYuiXP2GrVXer51ldy9/TyyPOR7tCPL5BTcsrLFTNpzfg18UkW/4KgX+TMU3PT2
	DCrmSvskdx4Thym0dkDKARoGAQET70yMcNBoqERzYQg9M5lNl6UpB3RT1cGQU1HooSaG0tfju//
	4i4wNOvVC8tIOWbwjvzZdb0foTHeq3L8UPHyXunuiKKVrTvZRt5woAS/6vuIZ53k4lasaBq3Ze5
	OpX7+qmdsr033OAgHDcfBr3o+1QBZtEoKcWHsq/nrhnWJUjsEyJBDk6pRSr/BaN57Qtf/rLcVYE
	JTjA2pZoLvwPJAXgdrQbj+LKF
X-Google-Smtp-Source: AGHT+IGygt7laEFN/zkAEpiLSDJ12LGPr49Rm+OrPOVFA30XtGNiFMrm/fruchKcsOcw2xI/4rdRGw==
X-Received: by 2002:a17:903:1249:b0:240:7247:f738 with SMTP id d9443c01a7336-2462edee76fmr127598065ad.1.1756061426906;
        Sun, 24 Aug 2025 11:50:26 -0700 (PDT)
Received: from linux ([223.181.107.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889f202sm48097855ad.151.2025.08.24.11.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 11:50:26 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] Documentation: process: Fix grammar errors in management-style.rst
Date: Mon, 25 Aug 2025 00:20:15 +0530
Message-ID: <20250824185015.6312-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various grammatical errors in management-style.rst

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 Documentation/process/management-style.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/management-style.rst b/Documentation/process/management-style.rst
index dfbc69bf49d4..4ae05a89950a 100644
--- a/Documentation/process/management-style.rst
+++ b/Documentation/process/management-style.rst
@@ -15,8 +15,8 @@ to do with reality.  It started as a lark, but that doesn't mean that it
 might not actually be true. You'll have to decide for yourself.
 
 Btw, when talking about "kernel manager", it's all about the technical
-lead persons, not the people who do traditional management inside
-companies.  If you sign purchase orders or you have any clue about the
+leads, not those who do traditional management inside
+companies.  If you sign purchase orders or have any clue about the
 budget of your group, you're almost certainly not a kernel manager.
 These suggestions may or may not apply to you.
 
@@ -42,9 +42,9 @@ actually true.
 The name of the game is to **avoid** having to make a decision.  In
 particular, if somebody tells you "choose (a) or (b), we really need you
 to decide on this", you're in trouble as a manager.  The people you
-manage had better know the details better than you, so if they come to
+manage better know the details better than you; if they come to
 you for a technical decision, you're screwed.  You're clearly not
-competent to make that decision for them.
+competent enough to make that decision for them.
 
 (Corollary:if the people you manage don't know the details better than
 you, you're also screwed, although for a totally different reason.
-- 
2.50.1

