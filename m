Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C9C341ADF
	for <workflows@vger.kernel.org>; Fri, 24 Oct 2025 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761326980; cv=none; b=moTSxoSpPKNWM86EeMNQCyyc0mT8PS2Dc42jvzUeW3Rxpd1MFj40kdzlwW8IzIv8Ycc79cL5X7WkbBi2yIGLRR6WalzyKzw2i6yd4yKiYx3n4nGOtwoc9Ww7TsteD39BqcBLQ4F8UuC01OqUJFi9sfW19+0gaqtQO7Y5n6h2me4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761326980; c=relaxed/simple;
	bh=tkAGkZZm4VXBDBIYaN4VChrZKvpzE6+s6VHxe8EmXVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DXcnGoi8tALVsJ8BGtBkbOZylr/4elnPnDrpmFqJHVxUIdOUklQ6gTQSdcMDNdmNerxCmwPRDbBDDlVozcoqfFAqVhgWsaT4GpYzZHc2m1nxdQmMtt+T3nSxzSayCigFA83Kni19fWTEoQMc2FZ6LsmZ8cMNNKLnjmdY9HWdtxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvekdrI1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvekdrI1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-273a0aeed57so40242655ad.1
        for <workflows@vger.kernel.org>; Fri, 24 Oct 2025 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761326979; x=1761931779; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cN7ZMnvf82THEzrEsUSGywR0GGJwzb8nUT5u5I/IIf0=;
        b=PvekdrI1sfGT/nnrDK/4lvinqsF0m20DVEwXO0UX9hqTyKcp4E4ARfEaUZvOvgYGQp
         jk/ZQ3LAct8fwMMLSl66z6DoLfMgmF8H9m9cEO6sxxTAeN+z8GFitULOoQ57p+b3vf4T
         tHq9PWml9e7wyq9dXJ79D6Wzm6lY8TrANZk+YaosMRIcNlMPadDItX7CbDeLlw38rmyl
         FzAwqVcv/337/WLkbtEFKPCZhTfj/nsJzp3JDSwLu/lZPgrLi3422ojpckVRcml22Fcd
         f+ccTzC3XmmBgelIAjKkLw8zk+Q7JA/ta/m5IWN+dXRuxI5FchvLRi256mQQL5a6POZn
         LkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761326979; x=1761931779;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cN7ZMnvf82THEzrEsUSGywR0GGJwzb8nUT5u5I/IIf0=;
        b=saT1JOkk96oTd5fkyLr/GMwDBC3Bwxns63o0Uh3e6JsoxHB+bnbOxDtEnLx5O8xljO
         azo7tN5GrTpz8kxIN14zPgi26rURNhIwH8PKR6Pdmd/Nm5P2uSpAGJlclj5eOEfDvkLV
         B7Mb8IdEQXYJvqua99rhcza0ba8NzCfuH1nE3m7t+MuolzB9V9iETRVqp6eE+P/lcGf6
         EELFhD2tgKpJzS9rtFUQCWw/88YZSoW2o3+lRfL0X/CMYvOQH4tDHV9uHzI5lLzeXgVx
         Kkl9KDj0j3RMJfylEJ7Jr6Ny7L7aPn03fEkzbPy8YSpYKy4/2VUaSnUk+IXpgIb8UK/v
         FF4Q==
X-Gm-Message-State: AOJu0Yx/mLKmAWRfJlzd2hpngSY3AK1ACJVBnH+hbmFYSNXpau+boNGM
	NDFxZzfWqCN6fmNM4ayIiY8rTp5tHVUQk45WbzciNYGZ9noEAW6uaQUIBVjV3FscAv8=
X-Gm-Gg: ASbGncvgPCtvMW5C0bpiuYG0H4Za3WEUj5plIjQeDpGneQ5ZB3HZjJgCAh7QCHtHXqk
	l89LWE5YrknsmU6qYQ7GmfrZ+c7ZJpi2ZW8MLVQfnJsZCVvuv8dZszDPGMnCPoV5OlvBtyZFRVF
	8u3TxaX7C4hoPA11NFqwbNuzNZMjzUhhCFMksze7bt3qR+whkERGnnQaHtRO3FtxQsVTNklUZj4
	5uO6NJAmYfqwIZJT2VgfDt4+ePvZ33qjB4V8sAKjEGjlOsKNsFBYOSUHjYUZXAoL1LbfSs2uPjB
	9juhICWt1BTTK/uiUb9lichHDfTproaDIRfMQDnyC58p1odwtu3SnQn6mpRJ8lJCQH0xo1goeV2
	/w/SPm02zrtvjUpU/+z449VFR+42zulysbpYDF/OiZ3KGtyvneu4gC4lwviJyPkfIWoML41OmB7
	SOEu9DopaiQA==
X-Google-Smtp-Source: AGHT+IExEqGK30pExEfkyV0gBzPWyWgac7N27+lB/OIuXkwNcep/BAxe9MOY1u0pDHlpOqqViu7rWw==
X-Received: by 2002:a17:903:1aa4:b0:271:9b0e:54c7 with SMTP id d9443c01a7336-29489d970b9mr43892925ad.11.1761326978569;
        Fri, 24 Oct 2025 10:29:38 -0700 (PDT)
Received: from aheev.home ([2401:4900:88f6:d7b0:8f5e:ff90:677:7d74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda85e7sm61719615ad.11.2025.10.24.10.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:29:38 -0700 (PDT)
From: Ally Heev <allyheev@gmail.com>
Subject: [PATCH v2 0/2] checkpatch: add checks incorrectly initialized
 pointers with __free attr
Date: Fri, 24 Oct 2025 22:59:14 +0530
Message-Id: <20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGq3+2gC/5WNQQ6CMBBFr0K6tqZTg6gr7mFYDGVKJ0IhLTYq4
 e5WbmD+6v3Fe6uIFJiiuBWrCJQ48uQz6EMhjEPfk+Qus9BKl6A0SHRESRpH5jHjYpx8eva8MA7
 8oU7aQCRLc7raqiRQCCKb5kCWX3vl3mR2HJcpvPdogt/7nz+BzLvYVkFrzlhh3Y/Iw9FMo2i2b
 fsCM2iMA9YAAAA=
X-Change-ID: 20251021-aheev-checkpatch-uninitialized-free-5c39f75e10a1
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 David Hunter <david.hunter.linux@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-pm <linux-pm@vger.kernel.org>, dan.j.williams@intel.com, 
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=tkAGkZZm4VXBDBIYaN4VChrZKvpzE6+s6VHxe8EmXVs=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDJ+b69OE5hxadfN1B8RE+/t1/v38+M+v2mXV02b+ibwy
 RTbqltrGDpKWRjEuBhkxRRZGEWl/PQ2SU2IO5z0DWYOKxPIEAYuTgGYSN98RobrNh8nPlTt+yIv
 o7H05CzFCQ90xZUdSmK0pRZt61+9/ZYFI8PGVKNg1e3zBZY/XzH5WdJnhja9wN7oZ1abNCadFDc
 4ocEGAA==
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

Badly initialized pointers with __free attr can
cause cleanup issues. So,

Adding checks for
- uninitialized pointers
- initialized pointers with NULL

Testing:
ran checkpatch.pl before and after the change on 
crypto/asymmetric_keys/x509_public_key.c, which has
both initialized with NULL and uninitialized pointers

---
Changes in v2:
- change cover letter and title to reflect new changes
- fix regex to handle multiple declarations in a single line case
- convert WARN to ERROR for uninitialized pointers
- add a new WARN for pointers initialized with NULL 
- NOTE: tried handling multiple declarations on a single line by splitting
        them and matching the parts with regex, but, it turned out to be 
	complex and overkill. Moreover, multi-line declarations pose a threat
- Link to v1: https://lore.kernel.org/r/20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com

---
Ally Heev (2):
      checkpatch: add uninitialized pointer with __free attribute check
      add check for pointers with __free attribute initialized to NULL

 Documentation/dev-tools/checkpatch.rst | 11 +++++++++++
 scripts/checkpatch.pl                  | 13 +++++++++++++
 2 files changed, 24 insertions(+)
---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251021-aheev-checkpatch-uninitialized-free-5c39f75e10a1

Best regards,
-- 
Ally Heev <allyheev@gmail.com>

