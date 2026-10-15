Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C772E52B1E6
	for <workflows@vger.kernel.org>; Thu, 15 Oct 2026 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072284; cv=pass; b=fFRWaj3Qe5Jdi9d/JRwXQqaQQicTfMMJT1hjZ9l1E8OU5CdnOxVp3ojT/u7IQgIc6tU7JC3vqnMoomCKxahGWbqJoCvD3SUTW5xZSsRsbTO6o2rNWfWdBwP03uhom8ITnIJqdRR601PG3jXmZuCloG+YXGu6V7fsaCPnYbs6P7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072284; c=relaxed/simple;
	bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsK/G6EE/A1PEHiLNbztOmk2VP5FEbjFVnRV/yiDa3cFWDayfF0Klq4cSdw1xrwOVUAjmrAGEMgu0OS91MXc02aPrhiAhv2Nsi48QVkNq+8PmWTGoyGHRvvi0OMlxxPw6gXm0GU5IdQQTf8g21F7iBZGKZgiLvFYW1GE39vcj3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZ/dg9pr; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZ/dg9pr"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33e623bd651so611161eec.0
        for <workflows@vger.kernel.org>; Thu, 15 Oct 2026 06:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792072282; cv=none;
        d=google.com; s=arc-20260327;
        b=Naz1jaqJVC/P6x5oIpxIRmtPtzGmRuoU/gpFduHSsug/yYAaZP3bTo/qpYInLZ+Mqu
         CNk0QuK6h+tmjxAw9bEubfxZjY7+mt5tBmCl5HWU3KRUYgC7ydyQqfpTPNlr7E/gvFZh
         pIfiS8CDCNOd5yBvNOYMH6ZtCSzoPRihxEmwctI0tbdB7/3/BeAxYoJqVIF8z3fBYOQi
         9ZEsiOVecc5HrXfDhUdw3OaYyo+Gftb6gKJoVdUKz+zTSroF8rKfmrB9ysfAxf7s5MkW
         q3F95vjKhrjzGl7SF5+zGYX1PlymbavN5LRF5iZ+1XUe4foxYFS4wl81OOzyfTbnJq4f
         VaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
        fh=96sLzAiDY2W9laXTkzgS5ttibS4j6KMeoIICz7vmU5M=;
        b=ThQEjledI05wm0xLg5l8b3ccwdh0zpJtFzl4TQoh/oQLcZ7+9vGOksesHtEqpuS4H5
         ySZ98K1ZXEj5w5pBxxE6ENyLaZkd2EFqyGBuwuLq0XXVm+iWoRVKB9S+X/VlzR7ci6v0
         wARHS6ynK6ilEOx1FJl+35skHoGMSY4XCjwZDTAZzHdXEz+nGlS9WcTUOsW/bydoL9O/
         P2H/FDSpZJRjzWojJzB9tCxIuRJaSeiz6Nj6PGstj4UsjXYwpwrgs5v4EciFPCC+fNGv
         CFrI4tMYv14a1VM0qM9m7EAYa7Hg/DyNHZYrLuZBd5MYA0tttrTglrtzn9F4JlGzT2tH
         gohA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792072282; x=1792677082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
        b=dZ/dg9prZ0KP2YvTOd18NiLXxQ+1dQTnLq550qLNcPZqjDNTOPrBDuhRZIxTUZ7O2k
         3j4QzXttFStyAfLgpSPUDrDSCxQFPp38Us0Hh2N5AKr6iljz/J/XGqkX8KeDuT0Km6qI
         V9fiEczcKgMvrCjdkkvM8GVPqDOdSHR2gq2K3bPy0BjXCMGh9+Kt/1AQ2Oxu18bd+RvA
         fuVj/ml/SjwMtWdLUklSshYhoChVh2lF+/ixP11CkAeWa3iT+oSoeIq4HG6wa91QZMCG
         t1fHoDV595R/J683rh2NDoAzXCZpty3rWp9AzRQL1qhMx/3T2/jacEC/PoO8YndqgUVK
         gFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072282; x=1792677082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmUmGGhgCmwu4QqELATIYyKkfGLgVxqbTfeFoXwzD+o=;
        b=R0VJzL8/z4yTbmxkVG7q0qYZJqaja5Dky2E1Es8udoMzBLNlhi4nahmTznmemYfr+T
         c225CW6UXXjfGCblEAN6vKPiqfLV85t4aTnx3gsn/R+KgmTDsNLpxEAaCPA4liuoMMwm
         X/hV816dwtAdoewecIRS+GiOsITNpTiPNQM3JtCzATXZIHhE8YUAPTCIdRaMivwRuyKl
         Yzr7a5Oywf1UVZL/UDiA6G925jRsmZGXfKwaYvgslbJPJwzHWepzNA8xJsmtCxdLQp6y
         lxRFINEWKQ8lWXUHz9rtgTbrRGBsRanCc1FnZ0QDgFxGv/EiAOXMfpiTEXFnRZ0RZZ29
         Xeew==
X-Forwarded-Encrypted: i=1; AKwUvBzjG7ZsLYzsl0Fk4vDPNjg5EOX7QRl1CrLfSGWcWcqqZEy5LGtEJ7ka+6vYRUulEIgIdCz5xpVNdGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrhdn9gxuom1PJURkVIzeD6h4M2L2a1/epCUR6X/fZOnbWTOTx
	YBiWiJi8ZIjisqk9sdGSNK69vUDcyB1+40HkdILFD7/Jpk//t35ItUBmkWmTzhVkF+yDfYA1Oee
	/Rho8Uk9tBX3PMZfC4F+gxA0UIKDb7GY=
X-Gm-Gg: AYBFou3qmG03I4NsCnuchktoTUaGCIOyWwEFkggr/feINnLHqLZeP2V6ZSz4uBYx9Ve
	qDaws93AJNL+8CtQBp/A0meWcY7X7554v7RWhrCTfNY+/cjmsliHCp0zy5Qp1N3o0zd3jXiDVd0
	+w7MtYEk8A17j/52mnSFZ1TlB5AjiQTCBXG2J0qWDUb7bB3UwdMeFJlJyFzpVCbdE7s1NmWSza9
	Xkl8FKWx5yeCX9bCrtr2i67doDKQrzwr+nJTMGkTwbXHwS/w34DPQ94QyBqVFBee8NanDZHHp3s
	+Di01GLqSqRANKCfODVqYBk/XlTErCmyZoD4DlS9RIn1wj6gdivhE+89W9C+LHt00fc4jLJ0zm2
	wSJPT4dXoeKTT24JnhcjqwIGYWYT8KvZ2WiDYR/r5kGnyUKoC8cl3hjuuedNxMG2bixiMTBqWuZ
	DUovQ0wbBEb2JgKaBbf8FQa+MTRVScpwgSZwYu7GS+pbKjXLPePiM=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr33438025eec.1.1792072281724; Thu, 15 Oct 2026
 06:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps>
In-Reply-To: <atDYWe9L0tv90Xjk@laps>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 15:51:08 +0200
X-Gm-Features: AclHuK933tu3BAWh-cwxecRjdQSXXLVeGjwcSrIBo12nakv0bx34xsgXHhrLXdA
Message-ID: <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, corbet@lwn.net, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:42=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Sorry, what I meant to say is that the spec seems to require markdown as =
it's
> preferred format. We can experiment with other options, but then the risk=
 is
> that we'll break some tools.

Ah, got it, thanks! Yeah, at the very least the `SKILL.md` main file
should most likely be all Markdown inside (and of course the
filename).

Now, if we go with `agents/` instead of `Documentation/`, then I would
personally prefer Markdown for the other files in the same folder like
the `guide.rst`, but that is just my bias, and it has a small
disadvantage: if we happen to move things between `Doc/` and
`agents/`, then it is a bit painful to reformat.

In fact, if it is all Markdown, perhaps we don't need that file to be
separate? Actually, is it a separate file in the current patch because
of the markup language difference?

Cheers,
Miguel
