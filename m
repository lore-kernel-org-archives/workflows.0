Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969B93A1A54
	for <workflows@vger.kernel.org>; Wed,  2 Sep 2026 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338616; cv=none; b=jgstWr1YMYEkri1Otv9655JA59FaGDOQb4gIsFHbM3yXLb56J/KwN/MD52BpPa+2O3UviiHUCq/hbSMw0xshenaBkupgUCr5oos9BMo8YsptTihIDopU8mX+yorJJH/V3Xv0bcIKp6byUMySJjoVNm1SuSrAHthcp4wbD5xY2P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338616; c=relaxed/simple;
	bh=pmBICbqDZ5ndY8g5s8sjBS+yRkZNsDVHROMv+bbKOrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PKSJEZGEoJ+OLgsyQFehec0DGyIEC67KNOj4ZJ5MW1dRGjNvNcA9w8vORxNsUbe5yL85EFH7Srr+A5xYZAMIYmDxn10aCWwpX0bEF5vK7Zr7Q+MianS1EEi4bnrpXXdDBN9yo23kjxKgF+YOg+P3NtfUcMrFzQc3t2trQrZ/KvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvnUj/Oe; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvnUj/Oe"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84864086bfeso665327b3a.1
        for <workflows@vger.kernel.org>; Wed, 02 Sep 2026 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338614; x=1788943414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+QMrkcuBf0aVbydtE8xfe+6EmPlSZfZnXnx55x6XxQ=;
        b=lvnUj/OeVHOOL+g1gnnOMPVDPmhQiacAjY657eXCmgPJqZfPXwaTAnWr6TqpwSwJ3b
         EqhG8EvavPPlM8iI64a5PMDck+1ycXv8H5pIEezhGMZ/QbbdrjFfUF+61PtFqYPLjHXW
         09lIyG6iFfROsaXUQMywprtRV6MRK3qV8Sv+Pt/GH/4GOWCPR6XmfiKBwCRv6mmyT8U7
         7mCB8KHacfkH5kW6DNp4gCwuNxZctSuGFsFd5WxVR7eqiB3WF+3Y5TbQV6BQjH+C2w9r
         kI/VA5FvUObpORokiO+Sg2wFOAflys8dJmaCMg1O0tTAEmvx/QBIuesehBgFfNS1k4H+
         rFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338614; x=1788943414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+QMrkcuBf0aVbydtE8xfe+6EmPlSZfZnXnx55x6XxQ=;
        b=DOKHrqlGu4+Eu2oPfXeXiWu+TmtqDE8SdtGLEqbamiwExdNma0sbgjRZaxyul2NLBH
         e4rNuoxGtB0GuYhxP+YzGg7VhwYvoQdgg0sry+9BXsSL9SlOGWSHBxau7RhqCOszEnlf
         lLXRnWHQdcFoN0bTS+iLGJDUXvZ32MjYOEaWfGKHOgBgPn3wbOws4pssbX/6qLdq9riP
         8sKNO0dVib7HVok99IzluWHYfqNGdLMN3gx4QqK2XTvlEivPyBwkMflbD5XkLAiLa7a2
         SiWbWpOwQLGl6iHC+MV1k9u3/jt6bopYKjx21N8Lo8N0l9K9iA3Cc7iUGsclZiFjGObj
         wqvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo0YbACDzmALtyJCNZUgfaILtFzqlMbcAPFQWithQScPD2e/JKZphc4SutGR0FkSJ72fJnSSGh5Ow=@vger.kernel.org
X-Gm-Message-State: AFuF++m9PmUVdyZm0utXR7l6TMVnTCISNHhPxpteBiAaPi0Sn3zu3BMu
	NlfT24vTLqAk58i4YkXsa/rCCyJU+vpSVAc5YDk2Gm7Xq2IHOPt7vsTT
X-Gm-Gg: AYBFou0Ol+AEEtduAzw0ZtqUybxj02EbLWptaXg3ZVJkVQjn5bd1fjozS9CwtqXFRkt
	4gOzt2xeFYwgAFgDyYCzqdzFfA/ahsNA4x62Ed5c6RLpG08jvEC7cbsEeLQR7EhCtDoR8gvCoTK
	S/2IezQ4l84Vv5+qYtlk8r+kjSbvccEX1ePKAF8wxYHYGfWB2YpH0uv2VPR2xYUBG0f9uHntYIH
	hZ6e2Z32HB9Nk6z0u0UTAkgm4coLtMykKxssA3O7ejYPg8DebEgQXBvzZsk5t9iZCT/ab4tVp5t
	b0d2xTBR9Sev2QF3Ubgjw1xNoTrj6PBRzTGodGE1uMjDV+9bYgCyI7PI48a8jZsrkot1XqA0xjU
	5rDWJilX5r7Vz5J0iakNnWzi2TPQtKHQbxAhvrkso7o/GfIghQIJ1K6ithJDSFFm21UUzh50odW
	W8MiGJCHYXe2PUspjmbi2kXRDNQD1wZuA9a6b8xXfe+ISJBlWT61JDJykw4qzn21RFZ7MRb0zFf
	aLLe47HJZY6t47tQlUWlHWnXjE6vA==
X-Received: by 2002:a05:6a00:10d5:b0:852:38ff:b4b6 with SMTP id d2e1a72fcca58-85ed3f6cd26mr4920805b3a.17.1788338613613;
        Wed, 02 Sep 2026 01:43:33 -0700 (PDT)
Received: from localhost.localdomain ([222.254.211.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc07157e0sm997498b3a.43.2026.09.02.01.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:43:33 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH v2 0/5] Documentation: process: Clean up grammar, tone, 
Date: Wed,  2 Sep 2026 15:43:24 +0700
Message-ID: <20260902084324.16498-1-ducthinh100812@gmail.com>
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

v2:
  - Resending the complete 5-patch series together as a single cohesive 
    thread. (Apologies, the v1 submission suffered a terminal wildcard 
    argument error that accidentally truncated the transmission 
    after 1/5).

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

