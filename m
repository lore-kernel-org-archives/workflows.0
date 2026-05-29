Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2951030E84E
	for <workflows@vger.kernel.org>; Fri, 29 May 2026 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060190; cv=pass; b=llxnispvZ+NNWxpubEYGVjJk90MBk76q96piltMH+2d4Lrwdeys28YMrgm9AbqY/AtdQQAfo9fQ0P5aRRnDUkqH290pJ+jK6QCmsj4DlYsVsLaShaaJ6yq1/ZLYrsJptw9dQbCQMIWNWGlaFv9ckCvGGJ76avXi+0Bax9sp1ogs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060190; c=relaxed/simple;
	bh=v2HeTxNq3PoWtYDMWwaAfJj37+shOuEVRHtJWh++R7E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nigMuMRma3ZTSca0/HuGIpSxm5F20w2WVJjrOWFp6QaFEpFQT/dmrPivzHvfMPyDKgPaaM+ZtfsDwSi+cvIAxC+grcGVFvMczwP5nrQFH3r3GVsZOcobyZ/LJ0G+ojZbG3VGLA5KqfNAvaL629M0AHERpi5UnpZ9IGljLfR4Edk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2dFnXHM; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2dFnXHM"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57754ec3462so9172954e0c.0
        for <workflows@vger.kernel.org>; Fri, 29 May 2026 06:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780060188; cv=none;
        d=google.com; s=arc-20240605;
        b=BS/eJxXp24sFEE4bS/vcS0YkXdeEtRflfDAntAiLWi1B0ECYiLbyc6xrEAdcmT/ZLz
         WDjBdN5GU0ykUcH2OyKTBuAW94ESaZL1jpkKLRYn/Gx2q4uKcZKxoiFY3owouYiyDWG+
         TqM/dvtqq0E9q3Bwa7MQgVGF9kb4fI0dZ7cvuQW38dgMZy7ooo/rZ4u2bNUg9J5BMwUB
         9cyRk3e6rXpZBYl9SysdiuvgGvafkYeFQkXuNfHluQfeu6T+2H6RwKywDWs6hTb4CZWw
         N0IalaDGjCvxqpFAChXve4nMFcjx7Et8MwbgUSsxbbbFGm/FG41koa9KiamwJy+wFSrT
         idHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=v2HeTxNq3PoWtYDMWwaAfJj37+shOuEVRHtJWh++R7E=;
        fh=7cPBddYPjf7aYOAPEfc3AwtYQk7kCCFyDxvco1WGy8s=;
        b=lM9qPNwtJNq1VrTXaaFpR2dzej9s8k6I8YNgMSWzxipQq43BD1tWtkEDzeq5tp1vpb
         yTQOBZeHWI1PKxvVuVjIvesZyT9ROlNOiUMAXZJyaHHDnQsvgp0zoMid7NNbZfizOQ69
         vDrUoHaq4zoM0Q5LliQiT7sIHaxrDnmiNgei4QlzSS7DjiB6zHdXUz3K6HiJpXrCxGAR
         jRu0NUKzYPglyapubGmDOOXeyQSm0ZAGLYuF4t3SUfohsv64BhtX8fzidpecSQV4Bxh9
         PLJvoHE+nzmKuO0nhbcnD1rW3Q5JHx/KxGy/UGOIayK4XFFsAvhUvu/qwBPbmd9nxiC9
         cB+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780060188; x=1780664988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v2HeTxNq3PoWtYDMWwaAfJj37+shOuEVRHtJWh++R7E=;
        b=r2dFnXHMriPohZaqBG4UqPktqVFvWeNS3CuoNr44nopMZTSW6ahm8d5eKcsAdDM6SH
         L4g4/4PeiF66gAxTHicOspoNYeW2h3noDB7BwXFDrQTJsD1dLXDanrjuU3H9EHzIsub8
         JWLNYHTgsO06w71LEo/jADvkZ1rRZbWulYmIxFWLhskOeGQk+WD5X3iWWJflpJuQicWX
         wxxr+QlWQY3Ztk7bUYQXw7Idig1mIRGoGYuzVGGaLXvUSnd/3/M+rIMzmDJo9NavlYX6
         XdcLdQkqqibkOn0yU9p9vvD/17fjgS78lSqMQRyTMDA5q7uICGMJpkmsABFa/gsvMoVW
         RfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780060188; x=1780664988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2HeTxNq3PoWtYDMWwaAfJj37+shOuEVRHtJWh++R7E=;
        b=DbZWKedlwpdQzHolSNYmHrhpfb8Mv2QRlvC4n/Sg9pl8Ji8ET3BhTBeVNjuSJyNP0O
         MrSED9xxLm5OT9wBz4GRHxb2BudsHJCpSmPbqpkGUoLfZxdzk3/dJSWGm5Bbl+URI6VT
         KpsFJfZ6gXJxk4Dq1/inv2ULNVl+RNWhQCelz8/HzRkFXY54/CkWD6ALSxI7zUiokfkG
         pqsk/+WFd49p5WqaUv+h34Qq2l0ZSrSesVo+Cv29SneXNbxoGyFQoTnnqFf39AvRVcY7
         VBSQTxJ3dv0hIqMao5RIshKyee4OkswkwQU0oohYx4DlvWcfhkU4kpVZy6KYklJ3bOI+
         SCDg==
X-Gm-Message-State: AOJu0YwukkZi/Bf9mNdThW7qWQZFuw0LNQE2JQINaxN7gSExgHUyN126
	fnI7I1RRVdjtYALscSVNsQVKOLHv9CVbCytqF488ALjPDJKeZ1peUEq8w39KnJhK9EorY2WXZgs
	XEMh+WAjOrNhr2wT3RTu7UParDEwMpOsB29YN1ek=
X-Gm-Gg: Acq92OFaCahVDWJaAINMAgytOBc001t1vXkLNC6yFqBa2AoJHA8v7iAl2DgYhUAt4Eh
	8udpdDHbINbPd+Ujak8+fNEGcCDEkSnlfAf26yYBl5cM3NAl1AJHdMSKV+7zLD43PHRmpMMx8DT
	ap7IPhrgS6hH28Mp6gTCaxPGDyBloSR6mhFQyyX5VSFgUJ3/Zh4qU4E9raxiPhS0dnnLMNBbzbo
	Ay4edB+WJ14FEoj9e+v71iB4H+UpPUT+oliGvKLpy2FMbc0twvgeadpRBjj/vQYAvn2hI1mD1PP
	FcPNy65XdWbjNH2eYyNZO0aNWpgMZkyB+9K+fi35BH2JrmxR
X-Received: by 2002:a05:6122:4d10:b0:56b:7d4d:4d11 with SMTP id
 71dfb90a1353d-599f2c4c703mr1000119e0c.1.1780060188156; Fri, 29 May 2026
 06:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mo to <pitar21@gmail.com>
Date: Fri, 29 May 2026 22:09:37 +0900
X-Gm-Features: AVHnY4JBM-Qu9vQAa9PhowlPhXN4BxV5J-9YRNJ2B4b1E2jg_GbxJjoXCPtSc4A
Message-ID: <CAJLQH1vPmWd0gL2MqfsTPF74_cSKqb7H8LL8nwjK2gYv6mB55Q@mail.gmail.com>
Subject: Proposal: preflight checklist/lint for AI-assisted Linux kernel bug reports
To: workflows@vger.kernel.org
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I understand that AI-assisted vulnerability and bug reports have
recently become a burden for kernel maintainers, especially when
reports are duplicated, unverified, or lack enough technical detail to
be actionable.

I would like to suggest a lightweight =E2=80=9Cpreflight=E2=80=9D process f=
or
AI-assisted bug reports.

The goal is not to replace the existing Linux kernel email workflow,
nor to move kernel development into a web-based ticket system.
Instead, the idea is to add a simple validation layer before a report
reaches maintainers.

For AI-assisted reports, the submitter could be required to include a
structured checklist such as:

AI-assisted bug report checklist:

- Kernel version:
- Commit hash:
- Architecture:
- Kernel config:
- Affected subsystem / file / function:
- Reproducer:
- Reproduction rate:
- Full dmesg / KASAN / UBSAN / lockdep / syzkaller log:
- Checked latest mainline: yes/no
- Checked stable trees: yes/no
- Checked lore.kernel.org for duplicates: yes/no
- Existing patch found: yes/no
- Why this is considered a security issue:
- Impact assessment:
- Suggested fix or mitigation:
- Human verification performed: yes/no

Reports that do not include basic information such as a tested commit,
reproducer, full logs, duplicate search summary, and existing-patch
check could be automatically rejected or redirected before maintainers
spend time on them.

This could be implemented in a few possible ways:

1. A simple web form that outputs a properly formatted plain-text report.
2. A local command-line tool, similar in spirit to checkpatch.pl.
3. A report.yaml / report.txt format with a validator.
4. A mail bot that replies automatically when mandatory fields are missing.

A local tool may fit the kernel workflow better than a centralized web
form, since it avoids dependence on Google Forms, GitHub Issues, or
any specific hosted service.

For example:

$ kernel-bug-report-lint report.txt logs/

[FAIL] No tested commit hash
[FAIL] No reproducer
[WARN] No lore.kernel.org duplicate search summary
[WARN] Impact says "privilege escalation" but no reachable path is describe=
d
[PASS] KASAN log included
[PASS] kernel config included

The key principle would be:

If AI was used to find the bug, AI or automation should also be used
by the reporter to perform initial triage before sending the report to
maintainers.

In other words, AI-assisted reports should include AI-assisted or
human-assisted triage results, not just an unverified =E2=80=9Cthis may be =
a
vulnerability=E2=80=9D claim.

This would reduce duplicate and low-quality reports while preserving
the existing mailing-list-based development process.

This proposal is intentionally small. It does not require maintainers
to pay for LLM APIs or run an AI system themselves. The cost of
AI-based analysis should remain on the reporter side. The kernel
project would only define the minimum structure and validation rules
for acceptable AI-assisted reports.

Thank you for considering the idea.

Best regards,
