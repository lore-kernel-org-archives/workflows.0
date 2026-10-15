Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB48453FD5A
	for <workflows@vger.kernel.org>; Thu, 15 Oct 2026 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080940; cv=pass; b=L7TBhCeLUBDv4MEI33kVAAn3fweX2MYRA56SRdDyMmWAqmzz3popLKwElieiOMIOKJAIMWsby9aTXkn3+MmIjWqYlXCR3WFwPBlAEYkadJ2h2K4JXxKw759FvxBkqE99G1DB0bFTkVtTIwFwOqt3+k7nFW+7JGm0+g7FZ2YWRWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080940; c=relaxed/simple;
	bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0bPOtdl+1TiBtdCkDR1LY/iSv6ebuTWs1QJbYgydiwIHMoaypbK7qNHBPZPsIaEErYHaTpwvYelZMYHksEJ/Zr8fcjaXI0yoHF2yohNRZGIAXseeOhPefupW8YIEIbtz937tnRUvL14vKaskp8fKFnFBryyniySEtzIt0dJWR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XutVYcfh; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XutVYcfh"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35e8253292cso149875eec.3
        for <workflows@vger.kernel.org>; Thu, 15 Oct 2026 09:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792080929; cv=none;
        d=google.com; s=arc-20260327;
        b=bQ9y1qrsK+gLP3iahQeTQGWY2V0mdB5pK67oi8LrlhUjQEUEryTmS5q/a8LtoqZtgz
         L/mqFtyOVkJWL5IWbiV6lkYPiLC6g+1pwz653umtIoYmoTDUOYXgQHNVkEYAcRdFCoug
         ZbM18InTU6DThY5SO6iNduaJylaIDFUki8XOqB/oZK8gYiQgHZIQ+h2X0Rd3OSM2gdLP
         0liuEaNQYzRT4XFfIzOdwHt0x3r0pRuc+RS5nRfqG86LwmPSmoCIqg1LeMhAN26W2nDT
         hYbyraoa7GCVzSRq72KSK1m/2Gfro5eWWLIkFNjLiRe0ubKEO1DnwNJf1Ew5idBOmwKB
         Xp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
        fh=xpFjlxSMMkikU6F9K/DsEYyySW6icbPYMuUI8YqIc3c=;
        b=locxEWpPwgmEGqQxtA/vyOH7y8BssCG2LuxuXB9cLW3QVynMXsr7dJjNK6l8pJrU34
         oRfTBQ6mi4wtabmiZhizqh6xOQBB6z4WlcHBLD6FRDI1eSr54AyWZAv7MCMHdx+Rn/PA
         NdP28J9qS9zbVIUUkaq1Jw/bq6QvcVb+R17/pDy330Pz9RCMBMzFm+9BuVFusve5g2ha
         Tl4P1MGjSSVpnZVMoC7j/UzPShgNZhd0ttoL0QEf4MlDaa+ciYcM4hOgyPiQYClQJc0U
         IxRJ+bKG7h/oqCeRoAklw85TsNArEOTFqUF7gNtb0saX/wtKn4SpkSsVJ9MyPzkAzWcR
         vvdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792080929; x=1792685729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
        b=XutVYcfhfuIwYt7oz3fIbtmTfgpStJjx0N7LF92toIkgvtGcj2MmD5s/cVeJiTxigI
         LV+Fyr3gB5C6KJ/2BkH+cV2QBADoqzCXxAmJGt1H2E7qzljiCj+T9pzzVWPKXWcTQey9
         SIomRRuCS/L+IZvkJRCM+9kgl/OyB8TGUeC0WzP5sNjFobcjxGSGT++Yd/ljP4ZVuCzk
         6iulHb5Wha2Ih86swcKayujTnHVNmYMWixdP1Coo6LvkJ5hM2U5tcLDG6iQeFvIPB+sX
         HLz06BZ8XKlGRVhsDLCkzENGM7IGpoyud+xiLOu4KoFxA5sxTfeTHMsBrODtFe9hRXLQ
         DVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080929; x=1792685729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
        b=H6GTt3MOvH+pTr8VPXDJEC++w8WSWtQIfE+N6zkoNq1ZeCbl1tOq7wabMu0tJygEZS
         P3OhSYlOS8H5y5qw70B4Lj7D2Wu3MBc9WN8e6uU4aN1FcHUk7jjyhGVS8GLfFXEy82fq
         otcV3c+VKJYkuuLt9r/zIBGMAdKuYkPhKR974v9FglLTDARaBWr4lpjjba/pF5uZUyzO
         Kgy0S4BsRFCDRQPoXb9cIwDGwqomkMvVwEDwwFA15Os+q5A+bsyPX4sV39NoGsp6nBW7
         N7nI59p9ry2cSYMqrXFExBMd9DLTG7tvq3g/NryCL88azgwhPpsYmvLg9lDFm8EiUUoH
         Lc0A==
X-Forwarded-Encrypted: i=1; AKwUvBym+aByxKHrWvJKrJ4wLqCRsLacP/Samz0Vh3A9C/XAz4LXwu2+GxTcXgVEexP7K6w2P08YuS1kn+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5px+NLvKKs0qarlbdYI+uPDhvcBe44lrh0KvrUe32LhrHYwbJ
	beUy0pW3kLcLlXInsq0OA0hW4S7slIqUclcr6S39g476zq2vZOI+2nV+7Yhf5rcpPZQnG5xUqMM
	UzC2oRrV/GC5dVXyo2YJ97fzqg/V6blU=
X-Gm-Gg: AYBFou1pgV/lR1w4XskftUb86bJtBHKqDABoySNl5Xv3NAprFrz9oJH6dvb9GbBVhC7
	GCNys71Btta/GkfTktpYYPtFOReJ3Bp9vvQGXK/hbAljzqqGvk5wBa4B0x3eRnby9pfg1Br2/Va
	0hcx6VUW83oYM4HJblXpV24fNVi4Bxt7aDCUunDECmS7UbL2yUh1AtpdRdbL/ahN1Q96v84wiq5
	Nsh+II9Sswig8Tledr0ObA1u2nBe6LunBvzSZ1eo64jnly8IjtNkFJnC08SbGRJ4dbu7vGx2O2s
	KZyI/liBXpQ1Ca2q/7LuCSkHV+PNPFCQ4i0CEgJ+9tCCe+uoW+aLm/CzqAC4xlykYJUtQFl8c0b
	dSzNyL9LLsOD0SAuB39M+NwqoX6nXXhK/U35e6hQIN/TqiZClGK8bd+SNUyuxjdb0GzoVMBTCGb
	WFIX9+MPwYVHNKCOBUAriAWzf0iJTFMAKsGsxPlmvktLYBQXy7V6FrldqaRjKfj0I=
X-Received: by 2002:a05:693c:66d0:10b0:35c:492b:e310 with SMTP id
 5a478bee46e88-35c492be9f8mr17514341eec.0.1792080928498; Thu, 15 Oct 2026
 09:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps> <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
 <87jynjrrqo.fsf@trenco.lwn.net> <CANiq72=raWNCedXQW9dSDwxQTE0hfs9ecyGChRPnWqO6DUvbOw@mail.gmail.com>
 <atDlfUEr-d_sRP7c@mit.edu>
In-Reply-To: <atDlfUEr-d_sRP7c@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 18:15:15 +0200
X-Gm-Features: AclHuK-PjnHmcyinHcDPK4Z6dnO9W7SGIPggSgvmNWFmm386jeOM2Bdrq8WVyuA
Message-ID: <CANiq72m+j4j86sCnKUzjjq8udcW+hgdrnTa28WUWfyFu9qHXDw@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Theodore Tso <tytso@mit.edu>
Cc: Jonathan Corbet <corbet@lwn.net>, Sasha Levin <sashal@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	broonie@kernel.org, ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:43=E2=80=AFPM Theodore Tso <tytso@mit.edu> wrote:
>
> I'm a bit confused why people are assuming that we would need to have
> copies of the same or similar content in Documentation/ and agents/.
> For agents are are *doing* somethiing --- for example, determining the
> correct commit for a Fixes: tag is not something I'd think would be relev=
ant for Documentations.

I am confused -- I am not saying we will have copies between
`Documentation/` and `agents/` of similar content.

I am saying that `SKILL.md` is necessarily Markdown (please see
Sasha's patch), but most of the actual text is in the `.rst` instead,
and that such a split is more complicated than a single Markdown file,
especially if we don't plan to do any processing on it (as you say, it
is mostly text).

(I do think certain skills may want to point the agent to some
`Documentation/` by file path; that is fine.)

Cheers,
Miguel
