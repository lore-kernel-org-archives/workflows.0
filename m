Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780E8481AA1
	for <workflows@vger.kernel.org>; Wed, 14 Oct 2026 21:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014009; cv=pass; b=qQqFVdC4yNVpBKvD1cBYhyefWJ6i55uYvOkQ8mystcxFOY0+HfgRwHvLesEido30jf7qdUlF+dlyrkc+01V9uQN4/t22G4nTy9P51YQkBWHUaEVdqHCGUgbdYGua6owQiyeQFHyBxbLur2CAKuH2+U1/Ft1/r1WyoY6SAntVhO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014009; c=relaxed/simple;
	bh=6ByUElvTvbGXIl2svxkrXNY8+hn0etgON6GqQ6cyQTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYlKE4is45lZd9g4f06RHnsXqm7nrgRoXOOAKH8qJXhEUNH0qMaRBAUbO+U2LLYgb4lhjt87R6gXk4jS2O+HcFDnz5kz/DoCHzp8r8sP7+LTKb2vyfRJqDINRHrpATRRcfC25rPXrvU2tRCEozjFhKGE6tGyPt11AWu6S2xn2XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiR+2g3Y; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiR+2g3Y"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35159e0092aso527074eec.2
        for <workflows@vger.kernel.org>; Wed, 14 Oct 2026 14:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792014007; cv=none;
        d=google.com; s=arc-20260327;
        b=Y/xbF8JHNMXGL0216Ig5PNMF33/XsHIH2MNVGM6BmGfJ0G3nylRkTZCvtqKlnLSWGY
         AWHq7La37bFpelhnu8DDMBI+UnQAfbYuYpee+iiAPw25ri6nsKnE/LLVxHCm/q4GOeVp
         70t5IxP0vWDTRpChJpcjKdDJMwz/RurOvDg03V4K4rh3jSbzhTNmPZUlgQ4p2jtznA+S
         kvjofoOJqhN6CLo5LpNoY4FJuhAM2GUMdSvuoXkd8I4sf6uRs+vz/aA+MJGyvPWiMCSU
         sJN5v0Cxs82fd2Ac26Sj0u3pDjHK16y3qSkJGIC04eOsmDf9+ZU2VEhvkNxsHgL3HCj4
         oadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHnikzVtWxtSM4n4XlSloqPUAIby1TRVs6neMZoe1Qc=;
        fh=y+2hlnEGcHSJRzS+RxgHq2+3bhVITolcOPsF3D3GOVA=;
        b=sq3jjecilRbbw33O2CJXZiNfLuA+aI8AUmfO4Kj0UZpa4UqOO1HLl7K2mBGW5rKvD/
         OerkEecBHUz+B+utpYEVAGN3b1Wyx9tSvLXyKmR4TtjoKTRpqgrjtWnfkGLhZQlQyEUA
         mW90edvF21o0AV82Dp0kLN5xGExNEWTlRUROMmPdjS4uaonx2d9yBXszqqzXGY/uBGmQ
         /iSYJPlsKRy34TBB9/K293D7Ve7XAZIs1vURzI3Ts1eg62piVllab/dOskz1B6olZGEl
         +xq+0Gire3P7d88xImSvWFTYFiythpn4Oza/z35Ypb0xN2tJUllVhqCOKOBGRrXPlQjk
         PxwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014007; x=1792618807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHnikzVtWxtSM4n4XlSloqPUAIby1TRVs6neMZoe1Qc=;
        b=QiR+2g3YVMWIX/sccYpOtiP//hCbHX0pWh0i2YDhfspvo8ESjM18rSssYbqCrmB4+u
         VY8H3VSiMrGN/LEpNY9cGAEVXyTC8yhwM9TX+ZCqb7M67G4nQHm5y0Dso1m/e/Iwv+Xw
         IegSm6MjwopcOKuICFNT9SGLvOH9HpyDqUbL6a0u92xN7e+7zr4uKi4JO7gUeUUZd104
         rteU1AuRaMe5vJvDxYesaWwDwILX2d3EYY/tbKsIs8WAB2kk7C42MRxQ1lZdo25KKPoX
         Pk9zcRwXYSjZasSFnoqpKzHYfjDKXSMD29+zm46yd8TTIecDtqwsFnR7Y9OaQi+AgIgf
         OLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014007; x=1792618807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHnikzVtWxtSM4n4XlSloqPUAIby1TRVs6neMZoe1Qc=;
        b=zMahJ0avXilHBN+aSWI3gMwsbw2esHKm3C7BFhqpDwnGr8dOLLRD9Hx796OubRcef1
         jjUrsWfpSDr7lFLNqen1J5wlDEHGrK2jz3niqYL7K1grrltb6kCj1/CGBSyn/TMlkfB2
         omO0tnsMiT8vwJZAKP1bbPWVK5j5mggrC52EXuCaJ7htiV8ob2QNl76p3ACqjJxgXPfc
         GEhsjJweBmpQXl1/a9pKYq8I5Ly+/cpdiT0VnCdy6MFjTjyezEt2mgAw4RHnK9zc0YrW
         6fExZBvIdN7p59OvON6bjyXeuk+zhpVT93XnsLONORjf3y0hEORD5QTQzDxR1czmQaq5
         TVlw==
X-Forwarded-Encrypted: i=1; AKwUvBw+NrBB2h2FVdgQGtTyavBQR84uEG2jXvHXMlkf7pPRJeOZTrY0KXwH/0prMT0NV6+GGHP5+304XfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr2suU1ZG7RZv7+h1K7dfc7Zoxnhy1r6rf7f+bklBtYbBCHk6M
	+Lr4uv493WfEq5NBsseKO1P5QklkBtAr38360CF8AlBWv3AgPqDPY6dug2n1c1hwKRbEQWFPJif
	KAwxMTY4TjxBcthcSURnaeQHL8wc2v4Q=
X-Gm-Gg: AYBFou2GM/E3H71MdkwCcD1ieKR/j5OujVZ6uh5Z567bTXBvDUM+VRuBnc1psFTxRBB
	Pd8S3seOpBhK9IAJybWcIVB9qeSQ1nn+ToUg1FtgGmyG1Bjz9Cxb89sfN9vKD+qy5yHjngaebQ4
	xM7CyksxLw6/zN4GXwWMm7mergFFvQaocmni0I/SkzQxv8aQTrkDOpg9vF+/CPoFQIYDyEPgWQC
	0AiJV/ChtFr+YBIh53ZbrSFmZKiRNaYidCUlXYxFU+P9S3OZVO0lqIA/Iip/Hu0hd7Uu+FMNsS6
	pmeHa8jfTO9bGBPHmCtXKMuul3kV39qVhMyfQqoeArLiR6W8OUIobnnJ110H4FaPuf4fLWuQSs8
	qxq/Pb/5Q2C1n/+l/YpmZnbwGmSkVb18jc+/NLgKhZNLzto6vSbvgNuufzbI7NUNJxIVEEdqobz
	MvlISWl7nnTqH2cHMOhxo3oyTptUV8BbaLhA3hAkYuxlogYwRUXvo=
X-Received: by 2002:a05:693c:66d0:10b0:35c:492b:e310 with SMTP id
 5a478bee46e88-35c492be9f8mr12948382eec.0.1792014007399; Wed, 14 Oct 2026
 14:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <as_j3DawEZQWA4ls@mit.edu>
In-Reply-To: <as_j3DawEZQWA4ls@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 23:39:54 +0200
X-Gm-Features: AclHuK_5--FJcHdnSAu17V1pN7IFpqktYq-YEZQOni6awj4McI56yNQSA9BFuz8
Message-ID: <CANiq72k1jOGG4JUWE_8AYwqnJbFRGieG2SBMJ_LLVb8GdjtxdA@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Theodore Tso <tytso@mit.edu>
Cc: Sasha Levin <sashal@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, 
	corbet@lwn.net, ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:29=E2=80=AFPM Theodore Tso <tytso@mit.edu> wrote=
:
>
> My preference is agents/ because these skills really aren't docs at
> all.  This is especially true if some of future skills invoke python
> scripts.

That is fair -- I was thinking that some skills will probably refer to
other files in `Documentation/` (like guidelines), and thus it could
have had some value to have those "properly" linked and have tooling
check it and so on (since the documentation already natively supports
that).

On the other hand, one can just ask an LLM to review if there are
broken links nowadays... :)

Cheers,
Miguel
