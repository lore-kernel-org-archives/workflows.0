Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D156B2C15A3
	for <workflows@vger.kernel.org>; Thu, 23 Oct 2025 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215488; cv=none; b=TCFJ/GIQUASg1o6A5WjjikKaCzokIZqeOrVBGnL2RIDXsQMy3FcXAnd4nqY+ZCohDnr2WSAugDzLxXKuc2wYl/aU/iPAEv7TTeDP1t/ePNRxfkBTyCrLLTMN+JcrsCiXmfvtWBzFIQPakiFAsLGsdoDesfwP3V9H8S48DlAr69s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215488; c=relaxed/simple;
	bh=899QwaS/qBo/eQEEqOZJ1fe2PB580ZJvPRbmYtXKqAw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YYrXsr7x5KY4qgRSuk6K/OuI+4Tib4sbf3/nkEPFXs76wzBK+2Vlgi8lRAyc7Dvngix7CArjQ+A57hBkdg34KfYAXzBdDNUj6QYhO45vcQjRTmOY4zLc1toAWchPKZ0xAuhCjJGUz2UzVIotsQrAvktMNwwuayzwR8p56ppDS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOLdOdeL; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOLdOdeL"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33bafd5d2adso649995a91.3
        for <workflows@vger.kernel.org>; Thu, 23 Oct 2025 03:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761215486; x=1761820286; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wOHVHTnLNd3I5eCIWrj3ovfAwMpdR53sEIeZpKeCdbQ=;
        b=BOLdOdeLcZgdDkR78FZbWLDh0xyNcjYapxqBhKrpx/vYYu00Xxy5Rvxmr2KvwfqT/w
         cuBdzCUvri2AARcPK6m/ek3ijnyyQDWRy+7KeFhahE+jmlA/sGaPZmKmTrcYievq14h8
         AZxBXqiQ6+IZ+b9YjMQPY5BhCgItkD2PIgNd/qLc+1faa7Ji+GrNi820AZ6cfSl58kdp
         D/D1BuWIVBBP/cAgIk2n1cyCqGL/6bg8M/GHjNLKEeo5CytVma2gPZDduz8wD7WtxMrD
         N4qy9fyOFM+5k3OjX/4jHxGL0nJz5Du4esGFmP0N+IjhOMrJkiCY/QqAFCrbRT8l6hAb
         egZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215486; x=1761820286;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOHVHTnLNd3I5eCIWrj3ovfAwMpdR53sEIeZpKeCdbQ=;
        b=unZpEQv/THOHQdW2gRiR8EUYd8YgwMCYVpBFVvcOjUzSAjF3Xb8inJuupBKiAtpZ85
         Wbbf29WeeXD4eCGIRd+gsEhw6MoFKJJsmLOSPUYgOAwe7U4/FCC8rp5vho6DevRydggw
         VmC1+sMvylDD3gnHkXRyI1LRQBXe4yu2+7UbmpJiUSZziA8SHqXVNcpRu5ZdoPfZIF3W
         OBpYWNRGhoNdlbooBaQuwFXdXenFs7y3fbnE54SNlI+ixsqJU2XIqDzN0Nu6ixnx6P+N
         /9lMAg/1P4J51CCHl86AcdP09OQ5crF++Jku7IGBa91UhbGaRy/k9Zj6gfbSgTCqNDYo
         bLWA==
X-Gm-Message-State: AOJu0YxbeIN7009+mZXEcEmddNoArOCEQfF5HjVtwAdET22V1EEXGX4b
	hhjV0Wig+NsEODzHnFV0U0fs/JImkc94SG0X+36oSs7/0ML2V3bJoHRT
X-Gm-Gg: ASbGncv+3Fra++Uqr1qhMA/zZktXwuV2oTQXr/rzNsjmXPMujFNAr8LGOH/GEuhjr/N
	GA5ffASGe6+4uG7y6nN+qVU64oiicTXZzZTvZANqdsGY5JxwUx2u5fOOabZxOGI93NiYjrUBD0x
	KcBw94E/QC54kQaUPugovhizkIe1ebuxjdEholXaEMspTNMiiIE48p+znTLPprUESOJpZSBnV+t
	rmFefqAtBuAfLxHwCbF9zOTau49fr8MG0cwPvHg2CsXMxSMAY9IhDoBce4RyWO7qbEHJX43WBqf
	a3+EPZAkCnCn1meMf6ZvXR9zuYtsgRfeYwM+Cz+wBAyFe6ruzbZj7YrbjGoak9lcmPxUG5PGijO
	joXy8YTUKsIqrPYMATppVF0bNRbu7yzXDdAYGb8EzTrIU0hpDF5C86wy32v/5yNjEHxYrSNa1Id
	1nBy5kJ3ZddYLiymcZ73+qlQ2N9LPeCf9syw/BVVoAU4AVK+QKPm/JRT9d860=
X-Google-Smtp-Source: AGHT+IHogv3WEFrX775pER3Si5KBPJbqZm7FQPT3+ZWzxhHVrbMp3JyR7pStbZJGZS4bVFRoU52R5g==
X-Received: by 2002:a17:90b:1dc6:b0:339:a4ef:c8b1 with SMTP id 98e67ed59e1d1-33bcf8f7802mr30752726a91.22.1761215486034;
        Thu, 23 Oct 2025 03:31:26 -0700 (PDT)
Received: from ?IPv6:2401:4900:88f6:3367:52e3:7729:9e2c:4d15? ([2401:4900:88f6:3367:52e3:7729:9e2c:4d15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4c13d58sm1676453a12.15.2025.10.23.03.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:31:25 -0700 (PDT)
Message-ID: <f9cabfed7b165299b8048670e548c671f300f2b2.camel@gmail.com>
Subject: Re: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
From: ally heev <allyheev@gmail.com>
To: dan.j.williams@intel.com, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Jonathan
 Corbet <corbet@lwn.net>,  Andy Whitcroft <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 David Hunter <david.hunter.linux@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Viresh Kumar	 <vireshk@kernel.org>, Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,  linux-pm
 <linux-pm@vger.kernel.org>
Date: Thu, 23 Oct 2025 16:01:18 +0530
In-Reply-To: <68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch>
References: 
	<20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
	 <68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-10-21 at 09:43 -0700, dan.j.williams@intel.com wrote:
[...]
> Looks good to me, but I why WARN and not ERROR? Is there ever a valid
> reason to ignore this warning?

makes sense. I will make it an ERROR

>=20
> I would go futher and suggest that the pattern of:
>=20
> 	type foo __free(free_foo) =3D NULL;
>=20
> ...be made into a warning because that easily leads to situations where
> declaration order is out of sync with allocation order. I.e. can be made
> technically correct, but at a level of cleverness that undermines the
> benefit.

But, does this pattern cause any real issue? I found allocating memory
later useful in cases like below

arch/powerpc/perf/vpa-dtl.c
```

	struct vpa_pmu_buf *buf __free(kfree) =3D NULL;
	struct page **pglist __free(kfree) =3D NULL;

	/* We need at least one page for this to work. */
	if (!nr_pages)
		return NULL;

	if (cpu =3D=3D -1)
		cpu =3D raw_smp_processor_id();

	buf =3D kzalloc_node(sizeof(*buf), GFP_KERNEL,
cpu_to_node(cpu));
```

