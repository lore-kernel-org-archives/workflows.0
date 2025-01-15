Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D2678F4C
	for <workflows@vger.kernel.org>; Wed, 15 Jan 2025 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955210; cv=none; b=sgoqtaUljhY3QOvZl0K+dLkoF6sKZV9UrhyExEQYpehKBn4cPm0ShX7wiwH8b3sLYBzvKPCbYflXqXvk8lvy+1NDs92NngehlJbGaFzdtc6bEr9pjCz7Z/yZvLASg+fGMtuuBLRXMkUvz6fEJFONS3PH4uNaLISSVh/YVUCjMdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955210; c=relaxed/simple;
	bh=KFP2R/TEoQs/HPOcYZBYMz6WTXXfGWe3Uff7RYjgJzs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pdgrvNDiWm1bYclaGYw/zqKOHvoFp0gW6bjXKt2B5lgcon64ERHjR94skp7qg31SX5btTk9lc9YaalyvLZ79cHkVuMePXq9Z/0IF8iZOngAKbVLxeX2IJe6qTbDqhyEaWSEQAPwAYTQjSewv0mJIiwYzQkKNUGdJStcR28CWB7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ez97Rrel; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ez97Rrel"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3862c67763dso2658371f8f.3
        for <workflows@vger.kernel.org>; Wed, 15 Jan 2025 07:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736955207; x=1737560007; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BJBiaucnVrlyZGdfwKV5yu0lTpLHyTZbtjA6zJmjN0c=;
        b=Ez97Rrelse2Ul/XDLV2ZQzf0Lw74W88uDp19JsfF8M0boYzcwPJL+AVN5PHIJmsAR7
         x4joTwhq0BG1Bg4wLzE8M3MfKg0I1sc7FqwnvzFtZBpFHgwXQ4Q8Q2vCisnJhm9kOTHN
         +HMLqt020em5/v2hYwHwCmq0M98rm5T5B5zBye1dGkLaKKFLIIGpG3y+yvww9PDUwjuT
         piODhKa5IuoJBFa6v2vdCXVST70sfVNmzyx1IRBsf2AWC28yf9CoGyZWXSipqccKRdJ+
         R7GCGDWFsqiZc8GykvvG9zKlaohM7W8rTsULEUHLc4z79j8kuJAPNFod7+DkOWbHmj+4
         8zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955207; x=1737560007;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJBiaucnVrlyZGdfwKV5yu0lTpLHyTZbtjA6zJmjN0c=;
        b=WDALj5LOI4JcBJBIdRxGjZIMSfzpVGe2EHI3s23Xg1wfi3cuQuDNeI0y573fs1kfI2
         jHHkH0xvxAt0Xb2F9FIs44JLkEWBjECJbz+RSLXuxXrugEbMWPKx85Lb7fe4iT3Yuwb/
         Cp2g/ZUkWgvyLYxxRbRFOtujyepI8Mn9gw1/qdtILpaTE3uJxbFzKTTUKME80DtyqEAv
         GELv3Eho26pyrIIYAT+KLcMsm9Vzgu3Mvo9u8iysRFrDAr80F63V1ya4USd7GZGXP9LC
         giWQfyei1gBqpTrMB1nd+7GcsxpgCpdeb5bNq00AxLIh/xwxi1mOIpxVTcooG8NXqd69
         ZWOw==
X-Forwarded-Encrypted: i=1; AJvYcCXmEr357KNbstwcRrUb0zyJVOuXpQQ0mi7XeiJ4LDNvkBkdRXH4GQUNvAVP9xoVxYyL6ekbk0FE6MU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEXgnm11GfYS94+R0ltmQhTwubJ3jeEDFE8Q1IOigfJXXMa9Io
	nqJxq+HjvwpfV0Lf46TpMAFMEO4KMCq7nr81ke3PvhvXEuW7yW0bs4NrEJ+0ypxGdhXffKnULqF
	lNBAjL7zwVg==
X-Google-Smtp-Source: AGHT+IGec8pT9Czh6kKpo0tNP/EdnFhwRJlZExf2SiribOd9imeMd9Roj5IO31SI4wSh03LP5taT4nEJ863pSA==
X-Received: from wmgg9.prod.google.com ([2002:a05:600d:9:b0:434:feb1:add1])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4023:b0:38b:e32a:10aa with SMTP id ffacd0b85a97d-38be32a12eemr6051086f8f.5.1736955207495;
 Wed, 15 Jan 2025 07:33:27 -0800 (PST)
Date: Wed, 15 Jan 2025 15:33:20 +0000
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEDVh2cC/32NSw7CIBRFt9K8sRhoKf2M3IfpAPEVXtTSQEM0D
 XsXuwCH5yT33B0iBsIIY7VDwESR/FKgPlVgnF4sMroXhprXLReiYcaheax6M46RXXxAJvigBiF
 7KfEGZbcGnOl9NK9TYUdx8+FzXCTxs/9qSTDOVKM73Uk+t6q/WO/tE8/Gv2DKOX8BpZb9V7MAA AA=
X-Change-Id: 20250113-checkpatch-ignore-1096914844eb
X-Mailer: b4 0.15-dev
Message-ID: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
Subject: [PATCH v2 0/2] checkpatch: Add support for checkpatch-ignore note
From: Brendan Jackman <jackmanb@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

Checkpatch sometimes has false positives. This makes it less useful for
automatic usage: tools like b4 [0] can run checkpatch on all of your
patches and give you a quick overview. When iterating on a branch, it's
tiresome to manually re-check that any errors are known false positives.

This patch adds a feature to record in the patch "graveyard" (after the
"---" that a patch might produce a certain checkpatch error, and that
this is an expected false positive.

Note, for Git users this will require some configuration changes to
adopt (see documentation patch), and not all tools that wrap Checkpatch
will automatically be able to take advantage. Changes are required for
`b4 prep --check` to work [0], I'll send that separately if this patch
is accepted.

[0] https://github.com/bjackman/b4/tree/checkpatch-ignore

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
Changes in v2:
- Switched to the "graveyard" instead of the actual commit message.
- Link to v1: https://lore.kernel.org/r/20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com

---
Brendan Jackman (2):
      checkpatch: Add support for checkpatch-ignore notes
      docs: checkpatch: Document checkpatch-ignore feature

 Documentation/dev-tools/checkpatch.rst | 46 ++++++++++++++++++++++++++++++++++
 scripts/checkpatch.pl                  | 34 +++++++++++++++++++++++--
 2 files changed, 78 insertions(+), 2 deletions(-)
---
base-commit: 619f0b6fad524f08d493a98d55bac9ab8895e3a6
change-id: 20250113-checkpatch-ignore-1096914844eb

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>

