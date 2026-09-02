Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623D7317163
	for <workflows@vger.kernel.org>; Wed,  2 Sep 2026 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338152; cv=none; b=Vyb+FnLcZNlDdc+/Cbp7Rm8zdk5OG9NbNT9vbbVFpzqbaG3hwVCgwLIlzST3RgJSRA4FdHC64jBda5m96C0eUjCZpNySnWbnsWRcruXElmhyDtscr1wldT3apCnCodQ6SsVIWnzXm+tbrrc5nX5mDzNlVaQ2OqkbfZHaNNJKpFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338152; c=relaxed/simple;
	bh=cUyU1xZiJ0lyFGAbiURDU4c+zI0gtGyVdTmVuLB5xTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VbEEqJyBXO8xjuM+DR/d4iAUhfrEIj0T/eGrT3pZp1niJ5Dunm/A6yqzMEYUQl9e21LieDbP+sn1O+1UTDJ00AU38ip6ahaCACVapx5lGP4JiOwGRbuWcoV4kX16XRidpZW+LkyaSDNb8lz2XalKzYZl4EPIjM/UtkSx6sUgBLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuAG+HEi; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuAG+HEi"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so644942a12.2
        for <workflows@vger.kernel.org>; Wed, 02 Sep 2026 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338151; x=1788942951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gfmhiuO6IGjOBYoQD0jOEFYQeE/ZkYP8CJmLAFzuAc=;
        b=UuAG+HEic/O1XGewbmK9wcZ+Mv2oPEN9ibEvPB3A+dCUkiDVfipeDc+LI3zWyGE/pm
         h0CO85tfbA9ULm1FfyvNElbIV1WGyBnVoA3Sd5UtAtJ4J2xW1rN8BUd6NT5bHetiijLy
         m+jJtkBIyejTenYG06IezThYcHllQ5RINyybt35bs1Ftmn6MRdFANNu/0KVZox9jmHhE
         D7FLxIpt2hh0RSes7e7pjT73MGZ7o/p31fQSSYC3m326yX97ZvWHURyUoM9Mf2mNM7bZ
         pikperU71uFti9zhtxmFqG5UPkTfagxYUE2goVQQkzPcHQTz5SNvdy1d+iMcr5JJYzz7
         HzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338151; x=1788942951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gfmhiuO6IGjOBYoQD0jOEFYQeE/ZkYP8CJmLAFzuAc=;
        b=ch3S34Hcwztf///FpiHL/BPD8USIAxb9TXavbxMBKIsulhAGBB4x7ZPGYhMtXOpbfH
         QPlTK9piuzC8JMWuWCJ9ahu3MdNc2m2+hLZaA10XhM/URbSO0qvtZ5LXLhFO/fmCFyIe
         4KobfPaTGR1WqJ+CCmRRzg8NjLNdd7Y/FaWykVM8l1LOd/Wgu/1L4+cL631Eae3w9Ns2
         ClQT7KQfx3KeOt6/ff3Euk7cCAV3PRM6CGfFhgWNdS+Z2jMdyiHJNEcuoXPtlJ+EPDKC
         hBSNdkPndSiWqW3RpJYMFyNUwo9umy1lLh7/EYcEQaHierNNPKPo3lpfLpx3lT1yHkAc
         YoGQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4xMx5f/l4u2nDNRCVywm79OJV4giO5LcnZy/SI189ZS12hWNbfz3XHMOMZ6xLi2WmfMICgQxA8To=@vger.kernel.org
X-Gm-Message-State: AFuF++mC3evwR1nxOsPHgm7vb7+efKbiP4SWmCTorgMg4C+zIB+Ecu8W
	GgFexOPr+efeFvIIzEJwQ5lEsuQf+1LtQJOiDfc/TTFA+Pf5Oj498uAD
X-Gm-Gg: AYBFou1A0tinqA7Q8Pf4LC4LDpVpmhzioP74WhM+AUlDOGy3pmZNhZqoeEF4LDBH7Kd
	fk3i7PtByyOxNXJbV2hNqxMTcJIzRyelSUXyUXyPJ5A7EoNIjI9Gn6GnUvhhCRSn5fJ5Y8MZZMI
	oW+mFuo1aEHNbXsmhvkiuebymUgUTkpXusE/ZofpoMdavQfAfJVoZKiKuJ6sKemDYvOHHUvGZL7
	ESEN9ynun445kR+QwvDk/XsIOCE8y6P2515yws89qW73xdc2u399uGD4X/WsCIudwWO71l/jhLk
	ZwRHJwJXyEoGuZ81+KjNM0VIlHOAbOrPAC4DxrHTQGq9tZvIB6tsTobl0b45Ou2C2e02lyPXUFd
	I/RmCfNJwJPaIZUrqyU34QyVw4zp93YVdiCvbnUxNtvrTq/3jeoUJUJLbccKqD4K5cbY2wsmTZN
	UyJyHtfY+m4e8+i+gzcjf2x4AlEgsWZGQS2EuGx8+/Qq1kvwbfj0vBN+o6Kd6BiaNyFohNwsebc
	y4k/ur2E7HM+DshmyI=
X-Received: by 2002:a17:90b:3b52:b0:396:d28e:bd8 with SMTP id 98e67ed59e1d1-39aedf61001mr4041158a91.3.1788338150515;
        Wed, 02 Sep 2026 01:35:50 -0700 (PDT)
Received: from localhost.localdomain ([222.254.211.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d7ba9d5sm11384800a91.13.2026.09.02.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:35:50 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH 0/5] Documentation: process: Clean up grammar, tone, 
Date: Wed,  2 Sep 2026 15:35:40 +0700
Message-ID: <20260902083541.15555-1-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs a thorough pass across several files 
in the Linux kernel process documentation directory. The primary focus
is to improve readability and maintain a professional tone throughout 
the guides for a global developer audience.

Core changes include:
- Expanding conversational contractions (e.g., "don't" to "do not").
- Rectifying minor punctuation oversights and grammatical typos.
- Standardizing terminology formatting to elevate professional voice.

Extra notes:
- I originally intended to send a 12-patch series to cover the whole
  directory, but decided to scale it back to these 5 high-quality
  patches to ensure thorough accuracy and a manageable review cycle.
  
  Also I want to know the current progress of the patch titled 
  "Capitalize Git, Quilt, and Mercurial consistently".

  And I would like to thank everyone for welcoming me to the community
  and I hope everyone can forgive me for my mistakes in the past, 
  present, and in the future.

Nguyen Duc Thinh (5):
  Documentation: process: Clean up grammar, tone, and contractions in
    core files
  Documentation: process: Clean up grammar and tone in next guide files
  Documentation: process: Refine language, tone, and grammar in
    subsequent files
  Documentation: process: Refine language, tone, and grammar in
    subsequent files
  Documentation: process: Clean up grammar and tone across multiple
    files

 Documentation/process/1.Intro.rst             | 18 ++---
 Documentation/process/2.Process.rst           | 22 +++---
 Documentation/process/3.Early-stage.rst       | 14 ++--
 Documentation/process/4.Coding.rst            | 48 ++++++-------
 Documentation/process/5.Posting.rst           | 34 +++++-----
 Documentation/process/6.Followthrough.rst     | 16 ++---
 Documentation/process/7.AdvancedTopics.rst    | 32 ++++-----
 Documentation/process/8.Conclusion.rst        |  4 +-
 Documentation/process/applying-patches.rst    | 20 +++---
 Documentation/process/backporting.rst         | 68 +++++++++----------
 Documentation/process/botching-up-ioctls.rst  | 54 +++++++--------
 Documentation/process/changes.rst             | 20 +++---
 .../code-of-conduct-interpretation.rst        | 14 ++--
 Documentation/process/code-of-conduct.rst     |  2 +-
 Documentation/process/coding-assistants.rst   | 12 ++--
 Documentation/process/conclave.rst            |  6 +-
 .../process/contribution-maturity-model.rst   |  4 +-
 Documentation/process/cve.rst                 |  8 +--
 Documentation/process/deprecated.rst          | 14 ++--
 Documentation/process/development-process.rst |  6 +-
 Documentation/process/email-clients.rst       | 32 ++++-----
 21 files changed, 224 insertions(+), 224 deletions(-)

-- 
2.50.1 (Apple Git-155)

