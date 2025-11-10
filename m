Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5DA2737E7
	for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762801567; cv=none; b=OvgDPkoIMpYSD+fLaUDABvJfdmEQ/zodTVuM9s0ct3MwPV6YO9H/A6UdY68HStd3m9LPAXUywirBPfEoTsInPIZRu7ulhoPgdV5aMWarAw7QgMOxYyRYldIMMXttmwAFSivYoqtQlNBJSIlg1fKb/ACT1XIbdqC7NAaJAXeqx14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762801567; c=relaxed/simple;
	bh=CyW/t0jS8/xtCGVfRnRxA88iS/kNa3JHC6SPci4mWhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWAh8bc147nM9eyIE00RkoF4e6+M3JR0aWvg6pcD71gekZDnaD31ULwoGzHsbRt3sex/ONCdOiEzZyiuZ9SDcM1cUQQkBB3MBv695XKW0gRAHhTefC+arvuROBQu9+CzX8HY0k38WbRCb5qjmsZBIakaNH9COXq2fQLYzjqWZAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hT2SeOFZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hT2SeOFZ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso1968686a12.1
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 11:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1762801563; x=1763406363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yC9h9KgevFORynm2Mt501XSQK9XREZd59bnsTtrcIw=;
        b=hT2SeOFZTXSkRwha7ZkWS4u9ZldlkZjACOXmBjkgxxQBP1Hawo7k5oyztuAd1SKHqm
         1ln1LYum17C1gsS7ZvjjZK9ILjOIxFR6rhJh/9TtZFuNHlKMsVZo7NFhUbdVB403ZjRk
         1x/gCT/l5ujV0/ELAa9Brw7Z30SKnz4AFX51U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762801563; x=1763406363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3yC9h9KgevFORynm2Mt501XSQK9XREZd59bnsTtrcIw=;
        b=QldMr3XOYnr0Rkp/1lY2vQxQQ9lm1mLsSkNI38HKgmXerJWsyTzL5G4OyxcJyHhTOy
         cTvWsthZFXeXzQ63oF7abdn2hHUa6BysA8v0SHDIMMsaIE8yAfpTUjUm0OB7NJtcJgYW
         JjVgv6NeS7DjqhKUAwVH7V3fcImpnRRIZukGF1bSA89UIoWczLJetm43vvXM1QUwXZ+r
         quZfwHnhayIs9aJ8eruvUjeTsf7Oou939YEOx4ZIOpZgjjpQ1j4+zBguYXQB95VioMl4
         hE1nn6ECS58JNWbIqGP4k8uK2CNToy2bUpEP4uXDSSg1EDNyghYdLCkTYcvSyrgKen1y
         HHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpntJXiO1F2o2genI7GGlt/i38xzf6tmo1tAhR+YHnVig2xSkt539YhcDegKLdTrJcwrxuILC2B4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwryXOVigBZOrG8IEqhpnKIDLYqLPOHovrcw+k9ZmLNkcpx/4Qm
	Av4L5PNUC5kNgMtk8UnLJPfEa2cm0KodroR1I3dBJzcViCX3kQsHI9rXo4kqRkDgBof8EFgPRJk
	bG7lThsc=
X-Gm-Gg: ASbGncuaI63SCV+upkLjruYX+K4rBcbqTWkzcSv4snt28nd7tPwnLYw07n3aTPC0udf
	x7pjUWpC7FAKOHByQiCumQLaiFVGgdE8KTUj5pFRMVWrRDdn0kBr3SKSaiZmWtHQE5uxPjlFcGa
	vnMstLBk1YRH5D4Ub0n6BoayIxteVLOumknN+KIrMZOI0X2gn5xaO0JHxZ33YiYSQxLs9VkTJKS
	2y0Bg/+f+0tcrB/aEEyZpyFhGw/Cs0WEGcSY6tWMfkmlTMTMIPEbwxSpsCgb1Y1Pfof8E1mtB+1
	uQZK+oeXKV4X8iaElzBd3DrD0a4MRrfl2G7S4ldMicHZK5s/ZahYBr3cyz6fQKq+4RmITSmTJw9
	NPe/I6U2M+ec0epmiiQ6ky7Sc7kbFFWbJ7vl7wesmy1er/pqqR7CZYe2/0BRsETzwbMGE8deCZ7
	ri3RcDuobLcJyHNcBKu0HBDPUk+V948tm4WwwXjjMmYSB3FKmYDQ==
X-Google-Smtp-Source: AGHT+IHhUdAUs9gs5M9A8Eij11z4FUl7jYtBhQwLhl8m8yXMt7zLaZ8SRIuduJwImZMhm5I2rGJIRg==
X-Received: by 2002:a17:907:7ea4:b0:b72:d9ee:db89 with SMTP id a640c23a62f3a-b72e056d064mr814918466b.47.1762801562843;
        Mon, 10 Nov 2025 11:06:02 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbd1ecfsm1132683966b.10.2025.11.10.11.06.01
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 11:06:01 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so4973271a12.3
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 11:06:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWoD9ROiTk7JLoUz0w/SN/3EFjPI21xch5UDLLuftxktxIsO6jWg7/U1xfP8b5KZ+yaXGSt9NQAoy0=@vger.kernel.org
X-Received: by 2002:a05:6402:4405:b0:63c:690d:6a46 with SMTP id
 4fb4d7f45d1cf-6415dc17adbmr8488286a12.13.1762801561491; Mon, 10 Nov 2025
 11:06:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105231514.3167738-1-dave.hansen@linux.intel.com>
 <653b4187-ec4f-4f5d-ae76-d37f46070cb4@suse.cz> <20251110-weiht-etablieren-39e7b63ef76d@brauner>
 <20251110172507.GA21641@pendragon.ideasonboard.com> <CAHk-=wgEPve=BO=SOmgEOd4kv76bSbm0jWFzRzcs4Y7EedpgfA@mail.gmail.com>
 <aRIxYkjX7EzalSoI@kernel.org>
In-Reply-To: <aRIxYkjX7EzalSoI@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Nov 2025 11:05:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wir-u3so=9NiFgG+bWfZHakc47iNy9vZXmSNWSZ+=Ue8g@mail.gmail.com>
X-Gm-Features: AWmQ_blqIHgBQQDHSwmkxkjAcHIrd3aWWcWyso6SGQ5JuQQ_nZmYCnfiBeXmcbA
Message-ID: <CAHk-=wir-u3so=9NiFgG+bWfZHakc47iNy9vZXmSNWSZ+=Ue8g@mail.gmail.com>
Subject: Re: [PATCH] [v2] Documentation: Provide guidelines for tool-generated content
To: Mike Rapoport <rppt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Christian Brauner <brauner@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	"workflows@vger.kernel.org" <workflows@vger.kernel.org>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Dan Williams <dan.j.williams@intel.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Nov 2025 at 10:39, Mike Rapoport <rppt@kernel.org> wrote:
>
> The novelty here is that AI does not only transform the code, it can
> generate it from scratch en masse.

And why would that make any difference to the basic rules for us?

  "Plus =C3=A7a change, plus c'est la m=C3=AAme chose"

It's a change in degree, not in any fundamentals.

                Linus
