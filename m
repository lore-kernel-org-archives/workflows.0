Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561BD526AAA
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913401; cv=pass; b=Qsar9kkpqkaItCSEMnXpZEi1OMV8I7ygUtU5dCg722lzj0kIAXr7tnVw+NsgwT0MNELvrFWv6uDmdyOb4XxaujngXHcXj7Is/g3P2oqBguhVyNXSQBdjNCLbKg5Ls3SRDPQ354TjTKfWj3TpnaF1LvXoWFw4ktcz4S00avZ0ByQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913401; c=relaxed/simple;
	bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHd/rvSfmwBF2epSKDlS1hOkz6+QAp3Tc+wrsFa1wt4VP2ruhTIfGTgBfTokS20kMXSD0rbz3cmyYlLxYu185oVeLM969RhqCAqu56IKJHnbwrvfM8/QkPRN2dc69EXbuDiCv+7VVxH06Cksk8lEVqlbjbu7LOUao99gIkD4SmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pt2qO701; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pt2qO701"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9178aabd30dso32865116d6.1
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 10:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791913399; cv=none;
        d=google.com; s=arc-20260327;
        b=fJnaGgVcCGKHbxlfGIr8otDAmXgWpq238y20x1Ip56p1CMBBCIa2X2tiDSTHEeTiTJ
         J0vChXWFv7kxK/V9UjpZZz6mRkJT3QZFu01m1YPf/iQptxfxTAtNpXH1WeO8tp/+SSjl
         cnLchezbSsaPoJeGI+wXdv0oVt/fMoAYmezRX+A4R9R9WuoZZE0FZWrCwNdiefMNxMp+
         EAHc+qAa/8+2JUYhXEAC7BgFFn1wK4AGhVILUEV54hMaeXFA/QTTPNQB86Y0jUnn3ASq
         hQSsqp2A269QdnZVvguWvi2/RFxux26c8pu3Q/yQF/9wKktwZgEe7IEzGt0iuGXgZFT7
         A0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
        fh=r0dC8CVRj2DHSjGfJhGYcikie9DdkQ16jS5t40WIS/U=;
        b=JSE1HL9ZOMrs4fvk3nOe7Eb8TCx6RQmkcdOoi9fjG/dv57ESyaONEM30sYcYrYS9Di
         XC2An0VE7bunCqRqY/70cbOF1t3PL3WToWSkeM7QvUUCDgrVheuqfMpJ+aYGR/RfaBvP
         Ik0zZGxEEXYHA+ari3ToG+gq7zC8LaeCcfau+ap2fOOb/L/LXgYg+sfnN88JDh7fS/9y
         5HUJeGzfmJ+DLeMJgnSDWIHHsIRKQ0imaGze6Fsac7cuQktk30mhpN3BPL3tYqIK6aZ8
         MFDfWnkwB7e4b2Urd8Q/6MH96+L91CaUWaBCS0UiToM7P5eyscD02YDueqdUnQwGI+hd
         pq1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791913399; x=1792518199; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
        b=pt2qO701mKTqdATmqkckOEX1DQSSVRROGlxomXS0xQzXlfnrhNJRA6vDqZ8YxToXpY
         fRtk/E/WKyUSdDKzAZ6gWijHD5NgD+jJ8YfIoUL7VBTEmpq/cB6bUyC4cpZLHemUbG+8
         yth+Pd3tcy1IAgQi0ExrzWGNwVito9cHElFMzkDHVvAaYJKEjt10V9js56EwZzw89nhZ
         ebpSoOUzbDG5DTchNq/FYHQKcHtAypTWIfmu1QA2NUVsWnIEfYGlD3TGdhTuwPN9QQ4u
         lFAuEgNTH7JMtdjJQKXgI0VlqmGHERQv58vLlMb8bzYGnjYeinhqOBLwwt6CAMd7OB2P
         m0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791913399; x=1792518199;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
        b=RPQwyzJaUdfRC6jJcfzk6sziTnKdAjJtZvzQfINJhgunr65TNW08j+kXOQ3Wg6Mcl4
         Dd+fR5QAFt7pdEYCoYpiv7Yn/zJG00o2YcCOdP6mt8Lub/Xd/6wB0tWo6zY33zBhBvq6
         Ppq/RKUcN+2VVOT0qhVyzv0G1B9HdbYd0e6v7jcRif9+MjqsCQ7ZPjfhGLK9PEJIIFHb
         POblzRTsfmywHnZJWyT9aGbTHbYiB9DR6pFTNfreJprI8NF/4kh5s9DHEJgiIMGYddkh
         Ifp5CYnrkjkUSPdEHA9BTsYl+VS8bIXhuZKd0QxBayVFY8pY9U1D3Ylax+fCsS3pbN2i
         1+/w==
X-Forwarded-Encrypted: i=1; AKwUvBycaqT7v3/rZYPdTmaVWf3/qa32YGT6NeRPFrYB2QbdsY6mm7zwtQUQjVE+/xYhNUc0Wpjf1qmW97E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRDJNlD6k/5GAQjexUTRGaxqOu9OB1vv10fMbTgJoyTITJh4Zt
	OWGeHSn6APWaRevcfkAG/CxRhQbd36+pwK5q7hBnVUbWDv9BANyW3AJCyEChSa+uOaG4/1vnpmH
	QxGzOEEO3OTTQ3p3Tyjl0M9aOA1lgNhA=
X-Gm-Gg: AYBFou0A+SDmf/nic7ofN4Fu5W9f1shf+exPKWwAJho4lI18SCwgl/RahTTg6PZWe+j
	T627tg3Rig1yZIjX4E9yfYRahUTWycYO+dD9qGanE+SMlz/FRFXWV59K8gmcYXr9/44JuZkZvvZ
	mLrMKJos04452IGjxFUp4fY4VBiV5Xji0A0/i0QAOL1+Umf8lCfPFcqLtpzZzefuXGVmX21OG7v
	u1a8k6NKVTBqa+QGzNngyy//Fa6fa12VNmfSTGueRaUUNd1S7p10L90psSmWQzc0TlkmbkeErY4
	g4zYOl7lDonDkW5l4a+rJibDRULnnQTJlhSuOF+ZknbTZ7bIwIZiTifAdntF3KYazsYlGiG0SF3
	z09V6G6EOL1OIO6snLlBbXeEUEcB/XFQs5RcjqtsNuGnos+g20YLU87jFH2JSELm0PTTR
X-Received: by 2002:a05:6214:5d08:b0:917:a256:c151 with SMTP id
 6a1803df08f44-91b557c63f4mr258062506d6.45.1791913398957; Tue, 13 Oct 2026
 10:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013121501.3738437-1-sashal@kernel.org> <0bd14255-173c-4052-993c-328a399f6c3d@sirena.org.uk>
In-Reply-To: <0bd14255-173c-4052-993c-328a399f6c3d@sirena.org.uk>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 13 Oct 2026 14:43:07 -0300
X-Gm-Features: AclHuK_GimhKIeFhMz-ydK4dBZDHmOtJjiFY_N4CAyxiONG6isgiNYLG7tOfvME
Message-ID: <CAMAsx6e8GhBbnvLUFkFJAm_fiORLZhOcbMnOsHS+RNPJKONx8w@mail.gmail.com>
Subject: Re: [PATCH v2] docs: remove Assisted-by references
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Weijie Yuan <wy@wyuan.org>, Dongliang Mu <dzm91@hust.edu.cn>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Jeff Layton <jlayton@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>, Brian Foster <bfoster@redhat.com>, 
	Carlos Maiolino <cem@kernel.org>, David Disseldorp <ddiss@suse.de>, Jani Nikula <jani.nikula@intel.com>, 
	Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

 On Tue, Oct 13, 2026 at 08:15:01AM -0400, Sasha Levin wrote:

> > Commit 78d979db6cef ("docs: add AI Coding Assistants documentation") asked
> > contributors to add an Assisted-by tag to patches developed with help from an
> > LLM, and commit 816d9992d9ed ("coding-assistants: simplify attribution") later
> > reduced the tag to "Assisted-by: LLM".
>

 Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
