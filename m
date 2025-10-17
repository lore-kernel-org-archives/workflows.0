Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96963354AC4
	for <workflows@vger.kernel.org>; Fri, 17 Oct 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733463; cv=none; b=s9vVnVaI/QjTiImv3x4mIszxU/2F0s9/aeJTh7m0d4rOiea+zALIOPSzE8YnXZVvo4AynlfsBs8/BKRNSq+s+fbCPuh9G6NXIJ6RlK8suErtVLQcqB5nnS4viASdB7s/8JnlJCQMUf9ygpuvaJY+ZBCS+VJaIgV3Uam1mxbOf6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733463; c=relaxed/simple;
	bh=t2vDXy/N2ueu39KGbBgzoIFHjBCJD6yAmUD06c2XdZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1Xubh5Oy6s2ca2x77147qDPrB9Er290dGi5OP9r/wkFQ9WSn2Dpl+QQTuJj/OQ8hQAOjG7UxsZ3le2a8AEO0rnaMKSZNBe9iGjWnc7SBR3f598HpAARz8rnAju+rRuDXy51jUubMwLqAPfh6BCqLvPBccPqor64QZU/I8AXhzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WKSMlI1V; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WKSMlI1V"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2909448641eso22650405ad.1
        for <workflows@vger.kernel.org>; Fri, 17 Oct 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760733461; x=1761338261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7PJC7jMvSltr45N6j/1sXc1iZUOgofsB+o1CC9x8JZE=;
        b=WKSMlI1VVQL+fGdk+hnhtkNrPTxW+8gKTq46Vgla41KT1Gr7E+MrM/dNuaAkA8KP73
         dkaXvB1MFQ+dUbDhzfB5bpsa9t79bwsdfo6yzWjeHsGM9KUSlUiEbqikGEyKh+Mcrh38
         CNZLg0wQ3mLh4XJZfVNQhBrJxD3wkr11b5wjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733461; x=1761338261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PJC7jMvSltr45N6j/1sXc1iZUOgofsB+o1CC9x8JZE=;
        b=jUdmBhikUCueUiY3WsOvZN6CCWAUb5dEJPF9+j8XVQe6c7wKp7tTseOJHuIu1XGUJp
         qusp4RBNH1gvvqBtdBQ0uuJxL9kehx4hDGwpixVFEwm/sHO0V/cMb3jihjlP/XmdYPW4
         +FJslC8vbVD5lSFeheIeEieSHSh99o4ZlvTGgG9loCApHsYrzz5XLyF0vDNHwoIRgZWy
         sop5db0yALdGTvIXtpVHFzkeoG5Dv1UQDe1TzPS40ntn0b4UFoGVh1BeDbgAVnE75LiC
         2KVDUpMdtlxO7ZWTFc/EaQ0OD8gIg7QUxh3F3gu1iGkpUjlmJsLosyrY2tirHZAZoqBs
         VmLA==
X-Forwarded-Encrypted: i=1; AJvYcCX2V0yC98rmrMB2iKnwsO8DbJe/wyLwSFJUYNV85qLVn1hGYHnQtWm53As+5EYRoy7g3vWZZe8U3fA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO8zCMPol89IOCEfuhUChKSA3YYkip3NviUNT394MP3PEUi7tm
	pzO/d0J+2xTszO+o2GNlTGCdzvueGxA758v7qunyaXT8iwwytkxUM8EPmDd+8XjbsA==
X-Gm-Gg: ASbGncsXKoQ8sNx3nLZUziEqndvBpZ1tMJQ0O3GdQsWMqnDws1KdLmiFUz/fiew0fUM
	ExQJqKIO6Xm+3DXt8WrZ3HXV/8NgA+hXxKvL+Trm2KxWyfKtHadx1AFifp5SHcj4oGuRjdKsziU
	vDpWBSpeOHbw3JjJy4qZfofcWNGe8aH7bs3mL+YYHYhiVElhb+3tOP3q6XI6AKCuPtiqRC8p31L
	SuZ1A+qqhVQgOfg+v6u95th3CsEHElSyLzlHAvh2J8E0eSa3GwbKckIO2meCs7yQW39T4dWu4wb
	a8Cw50UP2j/TNkaPnbPUgJ8QarPBV5LTFFLQWMPh1oNvX9abjaCXGG+1C74dJe7XAZ7vLjmAAs5
	aGVQc29HS9VMLc3ZixnyHQUPpESSUQQkaFG2xXDCYblAmS0EPABws4fJkpYme+haLftybGUSIpk
	9HvAKl9MWwjjbJXWGBuX+F6NZx622F2xVfwq6IYF23iJrmdjgd
X-Google-Smtp-Source: AGHT+IGroNG6E6CZwhT/9LbiABBUYxgk0gxokJeQCFd79Alxi774wplaobu25vmDQEPRfMelbU6gFg==
X-Received: by 2002:a17:903:22d2:b0:288:5ce8:ea74 with SMTP id d9443c01a7336-290c66da7e2mr76340735ad.3.1760733460923;
        Fri, 17 Oct 2025 13:37:40 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5ca9:a8d0:7547:32c6])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2924721936fsm4049835ad.114.2025.10.17.13.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 13:37:40 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 1/2] docs: checkpatch: Align block comment style
Date: Fri, 17 Oct 2025 13:37:11 -0700
Message-ID: <20251017203719.1554224-1-briannorris@chromium.org>
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
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---

Changes in v2:
 * Add Randy's Reviewed/Tested-by

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

