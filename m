Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D380414A0A3
	for <workflows@vger.kernel.org>; Mon, 13 Jan 2025 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784280; cv=none; b=MWho5/H4HvEktknijPEwO1WLd5pndpGE5ra+t7Px6DkxNgs05Dipshkw+DKemVGsKLcTL+HfnL042Q5jGEA0B92+5hv5qMB/j4vj8l1yPuIUCHaWK7CkBBeCz9r7lrl0Yg9IfVFpZCpvo9okYgcmJWnVlmMsdK/73w1E/oDKkHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784280; c=relaxed/simple;
	bh=ejY/FXwjCIB6xyMF5XTLUDGrT7TheE4P7/oHl1wT5d4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=P38nMNtC58cZelx2CgMZzBlKg5a4HzosyG8Qad6YZof+LAdkahbSt5N0niWIDDITzd/Epe6MBFmQHyeDL6HEXQ5/Ewh6WfetoBJ6152J6RZD8kCH5olJqk8C5wJdVdJE0agWvcOK/wYH+kBH4ijKDdy/pKg4h1zaSkAjc1dXE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m6H6q3Ko; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m6H6q3Ko"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-436723bf7ffso10158035e9.3
        for <workflows@vger.kernel.org>; Mon, 13 Jan 2025 08:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736784277; x=1737389077; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ui6u4x0QgcB8oB+XWMeJsER8HEYwKN9Ik+pWeVNFcaI=;
        b=m6H6q3KopSMWZ9IPKe3zIwzjYrAVxxDCGOY+jzdeiJSHoCBN7XuY/j4nqViaN1lDDP
         LAYiG/gYWJvE09+xPjLEdJFvK4W65lh5A8Z4O/wpHIdb8nox5uZ+gDWCj8jT3xA6PdgC
         T/gTl3r+HOdCIINGjxmdsQwlp/zFz/xT9nrEQsh9Oh4yMliNcF44dhUXfukmd+dyvPcJ
         KHoeoXCwljjqqF7NXvt0RXa12SbuewqzB3ZvWsRCiy/f6fk6LipiAQqNMd9pCXkohU8+
         Hg+jYoXDAnLWigLVyztBDZhY9i0c8p7NF2UpVL1G6+3ML+nWzlP9w/58+gcc/ThEE1ap
         BxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736784277; x=1737389077;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ui6u4x0QgcB8oB+XWMeJsER8HEYwKN9Ik+pWeVNFcaI=;
        b=Mnpo3+UqFja7ULq4+4KjRwofxBC4uE0yE8fgvHVu9WbGf30VC89NYqQ497BCC90RIQ
         WSp1SKrWZoeLsCWNx7kV4ijLIOXZKV2+ongg4gI9mfNask78iYEfHzrY0Z7QVV1AFJu1
         Y5bfnxVjXdy/6q2j9y/UIyU+RToSpuFFpefZ5sDtIJatLc26S3QvJt7I4OmJJzJ1wDqk
         wwM1dzjw8zY+aLD66pQOQX6z664VU+EHINWSeufsF8O/DGzDhcMUJjacQ/FshTteoAAa
         i7eDm+BgrcpWySK3LiYgR3SKACfrEs63DroqCvIgOvha/Dd3haSbopGP+e5wX7KPB8Lv
         ju1w==
X-Forwarded-Encrypted: i=1; AJvYcCWf/Z5lKim7ZptcDkPF98bziPlnjD9aTmAQtiB1Go2pQJRSKOWmS18tdk13Z9pY+GilEO3q2Z/C9+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3lSPcrhxgEK6ZNTC5GMQpSHQ9dfDbgNZ9n+B3ZjJO9ZCVGNMJ
	i4adj7OB0GqxavGIHHhvEeKNyfQl669U5aEUCjKYWkHhm13WHPy1w5QKZeuVbrmcab7tjYxKRbv
	sUjVYZuYFjA==
X-Google-Smtp-Source: AGHT+IHtuN3mlivsTwCTx/unsLTvMDz9YF7emflhWTPUs9zYdan+s5bTYff0igmdpn0dlOBVVMlpMDKTE8gCkg==
X-Received: from wmer3.prod.google.com ([2002:a05:600c:4343:b0:434:9de6:413a])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c8b:b0:434:a852:ba77 with SMTP id 5b1f17b1804b1-436e26a7e1emr215250365e9.15.1736784277426;
 Mon, 13 Jan 2025 08:04:37 -0800 (PST)
Date: Mon, 13 Jan 2025 16:04:21 +0000
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIU5hWcC/x3MQQqAIBBA0avErBOcssiuEi3MphwCDY0IpLsnL
 d/i/wyJIlOCscoQ6ebEwRdgXYF1xu8keC2GRjadRGyFdWSP01zWCd59iCRQ6l6jGpSiBUp3Rtr 4+Z/T/L4fzHs39WMAAAA=
X-Change-Id: 20250113-checkpatch-ignore-1096914844eb
X-Mailer: b4 0.15-dev
Message-ID: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
Subject: [PATCH 0/2] checkpatch: Add support for Checkpatch-ignore patch footer
From: Brendan Jackman <jackmanb@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

Checkpatch sometimes has false positives. This makes it less useful for
automatic usage: tools like b4 [0] can run checkpatch on all of your
patches and give you a quick overview. When iterating on a branch, it's
tiresome to manually re-check that any errors are known false positives.

This patch adds a feature to record in the commit message that a patch
might produce a certain checkpatch error, and that this is an expected
false positive. Recording this information in the patch itself can also
highlight it to reviewers, so they can make a judgment as to whether
it's appropriate to ignore.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
Brendan Jackman (2):
      checkpatch: Add support for Checkpatch-ignore patch footer
      docs: checkpatch: Document Checkpatch-ignore patch footer

 Documentation/dev-tools/checkpatch.rst |  9 ++++++++-
 scripts/checkpatch.pl                  | 11 ++++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)
---
base-commit: eae581be230bec00287807017839b3b2cd83f9ff
change-id: 20250113-checkpatch-ignore-1096914844eb

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>

