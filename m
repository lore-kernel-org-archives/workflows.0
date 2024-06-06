Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F377A03
	for <workflows@vger.kernel.org>; Thu,  6 Jun 2024 06:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717656210; cv=none; b=WcIKL0y8XdjjwCtkYMAvErq5rUa9X8vhwoRqAr5eD0L47ER1bSzxu1Bzn9VFdDuF6rTp1g2HDWfi+8k9f4mLRM0BxR+OxMipBZgvbdbaoHbxa3KpCRR3o5PmCZN0kxq8bRbj24So15JHOEGUZUNZhn4InZq5BpVLemEXWJmcx64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717656210; c=relaxed/simple;
	bh=lUTwQmTkXSAak3oROEANOq70038+HQrsZbNaSYQ2QYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D4+gt9yhtlAOb1MJCW9u5RIKu4KbrIv2E/1lYK1s46P1Vo5NjoWVwnwAAvIKKCZ72Q2sxh6cc9eexRWs50etavpe/2FmwU63gMU/GD5KtC5Ph1b7X67GgZYoVpCBAScUkvVYHBOBzgzjiX5F1M+YhZde08XtMA8yEbyFnt9QKWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JbJg1HQC; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JbJg1HQC"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso8143051fa.3
        for <workflows@vger.kernel.org>; Wed, 05 Jun 2024 23:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717656207; x=1718261007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omfvRqkaBys+keRVcCwWZsFLAUvdCTBnb4DeOzbHfX4=;
        b=JbJg1HQCh2aIquqEsg6HggZcyaY22fGmRrHencI4b9o9Ft6B6I/LpPumOX7WJWaShV
         90raB0HlZnb3aQIZWTtHLxrP16Yt3w4UgrHlEFdvvO4xbLRBI1q487B67h1xsnp0QeGX
         WX6Pd8szP/g3kaUjl9PcxbTNkVEI3HaFz6u/hcUDJ099VLAD75aSuhaxIemkmYxN+FyS
         PIiDKhjP6Mw0exWrhoBvOtv9bQWgONMJgqKxUnFEbDgh6uhAip4GqRmRB3nEG46JvfLM
         9eyvOeC9d6lZCp381zSQquyUkgzKJ4tnaowfzf8euWMTCAW6OhTgCHkNuF4iCCt5XX5c
         ZxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717656207; x=1718261007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omfvRqkaBys+keRVcCwWZsFLAUvdCTBnb4DeOzbHfX4=;
        b=JrmpcO0D9X2hwvYeMzhpgeigabs1Znsd8KQXJSsM72rBK6tjHCvuNSOd4znoWfn8QJ
         3Ycbw2go1mgu0Yl9DmBqrTF1LcK9VZppCedVfS0/GbaUqdsfV5oJ1hApxWl/b7jSrmtn
         THU/cEVwz0QxcIRpLu1vRqs9AX1F7dCeolwD8AGUOBiVCTVvoUrMGfKsKep1KNoULl2j
         kdZvbZBq/yEkU6ClYLjGLgsHOfB2jjQzabljAaHKs/8JRoBJU/zgM95oHH+vsqSBXRWj
         XUKBV7p3tRF8qfCFHHHNRK79N/o/Jguu4YMMnKBPFip8q9o0QqcnxAqv0XmEu1/rmftK
         r2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtojHLhcHaQi+RaYR0BMkG2QH/w4pci4AOtTK8FjyJKgVVnLnK3pjafRMXFfqD6P4w5Gs+ajBkD8warxNSiiBbnai4tjiT9WGA
X-Gm-Message-State: AOJu0YxBMcxHVlDIVch/WP053xG14BbNkffwVMFHPFL0wcQRFfyYjx1k
	NqANVLnKgFw3Fb6/zrKgCtcWEUN2hu/ynMoZrlRhVdjWGNcYKadnVk5OMgX9IL5Y7SbsBCdn61U
	u
X-Google-Smtp-Source: AGHT+IEGA59Ld7fxgXUJDzsTcNIscMWvDgsppmsiO4nhCip7lnZ+ctEKacwPIC1ddr/EL9VC/D6TNw==
X-Received: by 2002:a2e:9888:0:b0:2ea:cd94:60f9 with SMTP id 38308e7fff4ca-2eacd9461edmr14568641fa.51.1717656207292;
        Wed, 05 Jun 2024 23:43:27 -0700 (PDT)
Received: from localhost ([2401:e180:8882:8af3:26fa:edbd:5679:640c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de28957153sm499471a12.91.2024.06.05.23.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 23:43:26 -0700 (PDT)
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	stable@vger.kernel.org,
	workflows@vger.kernel.org,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>
Subject: [PATCH 2/2] docs: stable-kernel-rules: remind reader about DCO
Date: Thu,  6 Jun 2024 14:43:09 +0800
Message-ID: <20240606064311.18678-2-shung-hsi.yu@suse.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606064311.18678-1-shung-hsi.yu@suse.com>
References: <20240606064311.18678-1-shung-hsi.yu@suse.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When sending patch authored by someone else to stable, it is quite easy for
the sender to forget adding the Developer's Certification of Origin (DCO,
i.e. Signed-off-by). Mention DCO explicilty so senders are less likely to
forget to do so and cause another round-trip.

Add a label in submitting-patches.rst so we can directly link to the DCO
section.

Link: https://lore.kernel.org/stable/2024051500-underage-unfixed-5d28@gregkh/
Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
---
 Documentation/process/stable-kernel-rules.rst | 4 ++++
 Documentation/process/submitting-patches.rst  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/Documentation/process/stable-kernel-rules.rst b/Documentation/process/stable-kernel-rules.rst
index daa542988095..a8fecc5f681c 100644
--- a/Documentation/process/stable-kernel-rules.rst
+++ b/Documentation/process/stable-kernel-rules.rst
@@ -168,6 +168,10 @@ If the submitted patch deviates from the original upstream patch (for example
 because it had to be adjusted for the older API), this must be very clearly
 documented and justified in the patch description.
 
+Be sure to also include a :ref:`Developer's Certificate of Origin
+<sign_your_work>` (i.e. ``Signed-off-by``) when sending patches that you did
+not author yourself.
+
 
 Following the submission
 ------------------------
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 66029999b587..98f1c8d8b429 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -394,6 +394,7 @@ e-mail discussions.
 
 ``git send-email`` will do this for you automatically.
 
+.. _sign_your_work:
 
 Sign your work - the Developer's Certificate of Origin
 ------------------------------------------------------
-- 
2.45.1

