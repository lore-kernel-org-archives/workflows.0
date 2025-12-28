Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA21E1607A4
	for <workflows@vger.kernel.org>; Sun, 28 Dec 2025 19:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766950287; cv=none; b=tLVCRbJy0x8Z5V9cFVl5ahMZRPzQ1KE/r24Cr6BT47r95DYdBcW1j2gaXPDLEFXMqoOVpSE40/vNNSEO/AAy3TZoSlaPGMelHzN1b6ZIvRnzMhDJRPllFZ7xm4q/8/TLhbQNkROVlBq3xYPWGgfUs+m/BYkC6wO8pUjqlmxPrSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766950287; c=relaxed/simple;
	bh=Orp9GT4FzsRolBRRVQnvsDkdLTThrRs5gYaL14IJ5rg=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=YKN0F7p0RrFhICbf3yYhmFyiHXwEuzzkpLnkuU7+m7v7XE6yHibrEnKf35N4O57rl79KZdE/uyCGXedsX+r8R2T85YfK+xvz2vLHS4Cu1/SZeFwPCVq9F5IfHeZBbc0jxhZF58/LPlDCPtcQuVTqq5qGI80AHt8XIfo1xTpcre0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEkONA1/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEkONA1/"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-595825c8eb3so8734248e87.0
        for <workflows@vger.kernel.org>; Sun, 28 Dec 2025 11:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766950284; x=1767555084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nlou64nYMOBcyUqd2ccm2AWusSoW1FtniTuMk2SuGkY=;
        b=EEkONA1/ADdjtD7WrS4U/KWSLSG6oi2J78HMaLGd8TB4ONC7pv3hRJptXXVEGp2vmf
         TVyA2yJG0LFDjhQDNg2OHOv5Ca88j7qc0Y5kXS2YfFequerN1R2TgW0AWsj16760mEX+
         KxefUszY1ZTDdtVSnI0UcilqY+j0m6qwmMwHUbH+tHR2CstKiWI9cYj08eJdkpypfDF+
         LaYHLbSxm+RLbGGUb63T9xvV5Gx86GkiLwDLtwqu+xfldSlGv+wEnkQ6TGMr+D+YcV9z
         CsknYssocQL5bQXVPV/CqNqMuHvwbmKbaqCw3FtjTqHWJZv0R0m7/BYpSQF+xGeSygC/
         lO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766950284; x=1767555084;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nlou64nYMOBcyUqd2ccm2AWusSoW1FtniTuMk2SuGkY=;
        b=BvvD7HGJQJWpXpbPKyakEiZmb0gjNs/VoLH6iYsREICcrsg69y6HunjRDKjkEWhmTs
         lbe/RgmF3JN5rDW7v30i76Yv4hUhqrvOiFYYeB2njoPwgxTRmZ64jEGBRR+iu0C6U42k
         TfjqzkHMWZ7yXJx0XFOuBpFDpQHBySye/EcedA+WqMO1VS4xShnwJgtk7kgAC40i0yQ7
         3OaYz0S1eph3xztuKo6HbLINeFVhjjwKKv5db/DDebVTimKSF+qLU3dyvBXl/RNqRiip
         oW01d0FP1QWJ0fCKCcBC3iJiyujqu8LqwGZv4lxbwvTggrgaKhsIf0agRuyVtDyLoSU4
         5nPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLZbuXQNEBC9cpmTp4Ei3J8Iue5QWE1kCyqqzpaMv/jI3wDh1b7HsCeyiUHTDQgPk/zOLFEPwAp7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/AwnKO3ZgSiwtRk4Q7dULOO8wxfF5XUrBcz7WFkXcjjnKXpeG
	NEOSyE3ZfGhPjfihChUtUFqaP8DsDZwWK5ZrcstMbcJHikRuxN0q7evpao/0DobmR+VH1QYzv9c
	fgMqiSAPbo2sdUp0K7Vy2rZFjAZnuqTImsw==
X-Gm-Gg: AY/fxX5ZljUoWY0fWNuESSnWQxkpsnbaH3ZgRTut3PDJhnDZJDR4olOplnDXfEZb5dW
	k1lowEhJx2n5BlICwhlIXMmB6Qho/mDVCzs5QFPKaTV/5Xwuo+paenms5ysAa8ev6QgtSWC16TK
	njmnNNPZgZaiAVuXq/ZsbIZRQy8bPFHUiY2shTv3WwdmbKTrEOM1imUTMWL5sNh8B9iEIl8uavu
	eVdpbXSeyEObE+eWzFh+hRVNJ6cOlHoyOB4/2K6k11R5veQJarfYrH64RGjgz1A+RNooA==
X-Google-Smtp-Source: AGHT+IF2ZF1lZuSgacPxcBNzbmGh9Hs/kuoPsOkMwKOfhQgAQYOuGzalKTMTX480/bu3zgrHuw+gpDUNnz4UMeqfcLI=
X-Received: by 2002:a2e:ab1b:0:b0:37b:9b28:4282 with SMTP id
 38308e7fff4ca-38121561689mr84166671fa.11.1766950283766; Sun, 28 Dec 2025
 11:31:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:31:22 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:31:22 -0800
From: Benjamin Philip <benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 28 Dec 2025 11:31:22 -0800
X-Gm-Features: AQt7F2rj2A6mjYRlTxgLaDccc8hLu-6HWeHyfxGZSgP0M4HMyXPK3wduUsrrhFc
Message-ID: <CAMEXYWegtqikPYBRaZcpd_JwQPH80cXhaRK66J8ZhWPrYc7-yw@mail.gmail.com>
Subject: [PATCH 0/3] scripts: coccicheck: document debug log handling
To: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

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
