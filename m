Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082542773E5
	for <workflows@vger.kernel.org>; Tue,  6 Jan 2026 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726549; cv=none; b=luEjVIXaMe9FScjmLb5o1mNhhRL3K33CmvoG/tBOwTVuJFZZZScm6frA9ue48TfBxrOBcFKPYmICjOGvKFYluSQ1bXjDGMcCo/b3fGvOGJcHhPHO6rgPWSYi2tANa0s4QcZpoLAk87GUoUge/3jLx1ztMkXEwpZcqsN92sc/VLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726549; c=relaxed/simple;
	bh=Orp9GT4FzsRolBRRVQnvsDkdLTThrRs5gYaL14IJ5rg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Takpb9vgpDnfXScg9P1CAFr7tU7H3E6xNgsF0gVvIFOjulW+Dm60jSQmy4HZIaHKbUCCmeVxIVPUDydVFTX0NpZh+z1xs0w+wVpld3rvWEMx0VWd0TWp9dVKhM6+eDn3afJhWSrk7l0+Gj1mGnts1VfX0L7JzIeoxg1ARUTkAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BF8QxnRe; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BF8QxnRe"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a0833b5aeeso16247845ad.1
        for <workflows@vger.kernel.org>; Tue, 06 Jan 2026 11:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767726546; x=1768331346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nlou64nYMOBcyUqd2ccm2AWusSoW1FtniTuMk2SuGkY=;
        b=BF8QxnRe7dPGmwIMAOg0slqBndJ58B6b/AHBb0SodAI8y9OKUT/Srz7+IZKjP8Z731
         lEu8K7w1UkZYylsGB7CNyuxt5vmIj4hOmeUQiQrlLEXAg8tGFkeSj9nWm3PcPGgPepV+
         wmBWcmJYm6EQVYpL/Luax9Q1z8kP1kGgKFCMVh+YG3UYjm/h+MYcPFJyPe0In20iUse4
         8H4ESfrJGrIt5HwD1OyMikI7M0LUABpM3VkVrHd1xvcWCT95dOtLvNs1l+0lNGgcB0Ft
         1Dg6lRwkH1JITOCgG7v3tWkpa940w/JQ/qO3C6RtKDz9Mh9uY1OnTa5WCQbu/iytysK2
         sQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726546; x=1768331346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nlou64nYMOBcyUqd2ccm2AWusSoW1FtniTuMk2SuGkY=;
        b=hDe/v9WjSTycM+XYeQjAYueul99UFcKirYnzPnLvUF5Bjm18MuGFPUnaZ5HxuW6seZ
         PO0q6GBf2IawnGpYvOHpQ3aausIrXdeiHwGT3DNx4i98fu+VdG8FMs9Y1fr3t3L5hYZt
         5KrVFdP3ZQRniSA85DkIhJ1qxxo1xZYwGmbk0nuO8dDzRYDYGZThpao/BXq9aeRc2eec
         0vOxGnqZmlakyJ6QYq/yvNx+4czB9ffJlV/SRtBSOtNU71SFai8rxY38u3pWlWfEyx/s
         33BW6f+BsNRdr9ybFKPkx/kxZPszgkEkvh13MoLQ/y1FW5ywbN7h9U63qyKEpEQtnPYr
         zhLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXam7bhSb6gtjyDW5uSHS4ALXRruCDFooCRY6h6NXVvIuFTvuRgW2LTO9hTAgCT6dwIbxYwTCkFcGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAWhh7WH2KgR4UD0+w5f/BZQhXdBRx4RhILzaRMOf4jXjioexU
	VDDhGd3ipKZZcEQOYxMaFQoC4nil+DIWpOEx/E/xjCUSvsWrMCUNeg8t
X-Gm-Gg: AY/fxX6onDUTYZW5CIKhNaqBFj8uWqTVehG+pAFg3MtAJBGBLK+gnP1naneAhOCCWOa
	2MRfMXDzwahkRVYpca+ep9JpPBK6hU+pXOUqNM3sejCAFDa0qsHiX0HZeWhZ87YoKhERJfGxgKp
	RLGDRApHAiHV5oyqkVUDcfTEw0m94mM/sNKfmePCiwXQX++zb5Q9wBANpL2jnAwtPTlBH7k5fkN
	DC/tWsbcME14xHmQ5m0X3tz0W7zWjBHFP4pNxPoKDOoIXmjYyAOQ82VvDCM9QDrr77xxWJW7+4s
	tfIYts/Ev+ZTjN70X5Wsum4B+gkkBYhpQZN6s8MLav7h2hBs1ORCh+YWH20f/lKjQifL0+eCgl8
	TUR8edaDX4OJNvXKRczzbwXyt8SQWHG/t5EzDJGsItzW66zZ4ImZvawMtN3YEDVCcZf1s42QMVl
	qXA/R6d4M09W99A4VpEA==
X-Google-Smtp-Source: AGHT+IHzNi2QQ6a6YY1+BH+FZtHb24yA4doMuZNruN/8XQ2zpvmyGpEfI/vMxw9xDkIfGB9AU9JdUQ==
X-Received: by 2002:a17:903:1208:b0:2a0:be59:10cc with SMTP id d9443c01a7336-2a3e2df52a1mr36627905ad.32.1767726546276;
        Tue, 06 Jan 2026 11:09:06 -0800 (PST)
Received: from rivendell ([101.0.62.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc78c0sm29380975ad.69.2026.01.06.11.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:09:05 -0800 (PST)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH RESEND 0/3] scripts: coccicheck: document debug log handling
Date: Wed,  7 Jan 2026 00:38:33 +0530
Message-ID: <20260106190836.36630-1-benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently coccicheck prints debug logs to stdout unless a debug file has been
set. This makes it hard to read coccinelle's suggested changes, especially for
someone new to coccicheck.

This patchset documents this behaviour in both the coccicheck script as well as
in the dev-tools documentation. Additionally, it simplifies some of the logic
for handling debug files.

Benjamin Philip (3):
  scripts: coccicheck: simplify debug file handling
  scripts: coccicheck: warn on unset debug file
  Documentation: Coccinelle: document debug log handling

 Documentation/dev-tools/coccinelle.rst | 21 ++++++++++++++++-----
 scripts/coccicheck                     | 21 +++++++++++++--------
 2 files changed, 29 insertions(+), 13 deletions(-)

-- 
2.52.0

