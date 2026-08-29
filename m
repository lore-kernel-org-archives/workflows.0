Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E4033F5A9
	for <workflows@vger.kernel.org>; Sat, 29 Aug 2026 10:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788001057; cv=pass; b=cQ3ZE8A4tmwh9lfP5q0ZLX2twwyWxXpIo9rTiUXDo6Pi24qzlVPNwUeZWWhY193vfTcbgANb+b+VDnFsjsrSwnmm0ofZlMN6YBWnkvRtmwEqznAAWw4vICDyYstskqclfoP+oUyrM7KZDjk7nck1c9Edz+4k43gEPey8BinUrHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788001057; c=relaxed/simple;
	bh=hsBKohLfCZd0jfnALC1cEzA++W2MrcDhahlgqPLVM7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmJ0qU20IDcrvW6qZpI3WdCxy+xyc1FoD4Z+6NOUWO88PKINuLgw/4ZJ1tV9/cgO/hInc6weCGtnJJXDauhqc3PyCJJB1or78Qhi2Cqm0nsorfwg1Ew2DrmPRhRRaFB8h5jXRzhcs7iA0nZNmFVEAI+XHfrDt+Jl9eiOatUeb6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxB9/ucO; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxB9/ucO"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d590f4c291so5137545ad.0
        for <workflows@vger.kernel.org>; Sat, 29 Aug 2026 03:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788001056; cv=none;
        d=google.com; s=arc-20260327;
        b=EymwqOsIX6qzaThXis/GTuLKUikt+0kYJ/zsbIVndxJGIIJXLFNepc0HXPzWXiEBqt
         YQy3UkoGUri11WUUaD2Hd4YSnho3u14r0+w5OWMsSegdZVH68ffOPO3wctBGsgqcoikY
         8uXk2oUSsGcQapYxdGKl0iiT9RLJSPoJouNUTlguqn7kdMdVKl68OhDnAXOkFKvmzvKW
         5HPAae0IiAhHptFZx+gVj3rnkfm6ewbxo563Oj29nCfQsWBZ3LlfMC2S2IajjzLNYv6S
         ujJgpheH5xfw73UMmwS9Ww+Gp8G+KVgMfmAenQt6dBsAcP0ubZ9dqqMz0znEd2NBt9LJ
         3c5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        fh=1dsCRhcPhB1m08vyAuBlE8IWZ+RevqLYqpTikOg2hC8=;
        b=OOzhf60lFPhnrcfHve18JoF7WLcwwLVunxzIas4bLdhLMT9T0bvC9jZgOeSHzs0x9e
         z0MsQyHGVVEQoeHwQqZWuWHPSDwYToLnqwaOssnZ285Q49VXXxvO8FLLKIqpjHVpjaY0
         AcJk0SfimK+GdSGFWhB/ornSMpAWQc3cjYJjefVLlf5gPauCKDI7HI0bX9zWv0DyQBTp
         zLSCe8xfgOoG3rFzSkjF3CL8XBolQp/kZYAZJkFT2fONuXtbjObRBx7+16iAv89CiG2J
         Og7Xhn9cZXTkbkPD6A2ofQp1FEAnC5dShPvVHgMyTBvAuZOOmFiKnfNJVNalkku9gNxu
         Vg5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788001056; x=1788605856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        b=qxB9/ucOSNJYhkRxeEyJuIaaChnbkIeziSSD+2tZkrRhLbLNtPwwaw4AnOsFMkGHgH
         g8av33wNg8aFOi0uNrjq+Yypt2oDfrdfygCqbkDmAzG5fuTS1GaoG3u/rzSOQp64bZcr
         Wr8t+It1pfy/S1oP/PjrrW6Lt8BGDP9OyfNZoC6PKX9aTpe0hvxrhZVOb2JooagrMlPz
         TUMkgAqwJXV3g83TJ0bJH6Fnm2rHWOxxW7ClpQ3zjd3BOyBL4NDx9juMBCRdInYkLope
         g97Vy96kHGCKy87vUJsdUFVo8/sZJhGJwdy6K//5s348jFOgAAUIsevfCJRcwtlGtwCE
         +tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788001056; x=1788605856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yoXZjSinVl6bLZjtfCsRoIy2CcONJCPzcPUWytAk2w=;
        b=W4C2cM1Tw1DHUsipawOl7bchf7J9PYmdgni1A4OdIzIM1KiFuzAV150gWNtlFOvrT/
         ene25NMGAb1gZQlobJm0u6zi5fQBEWiOUhxjRAwXdykM5wGq3lPuOeRIWlx4cPirol5b
         eRi8CFmVIAw3HC5xe3NbtciRqPxJJS3ramW0S2A9xi4EzHOAzQgwoQUSftup8qcVv/kM
         1K0g5lHrrgxMqyvTINs/ZCd5C0TYsQt70QKUXRuWkhFEEUI56awIDfRRthrNzzsYu4ZS
         Fd23NkKExmacn4H1z6Oz7faqgDfvtxRkmvYPQRLl0gS5I+fkpQEVQISVVOskq5vOW4aH
         G2RQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3eTm66dVvkvGsaELUT5UpW8lkVhrxdw0hMkerbWncIR8RVcIA8WkAXRrTu+ZwbQgniYUpEPNfvbY=@vger.kernel.org
X-Gm-Message-State: AFuF++kEgVrUMSodCnb4RcIWnxbN9cA5YETy/LZA74qiOG2CIflTSWtg
	cqSSq2rgto6GSooRu1c0zHDSqGEcYJqpyoR+BlQNvGK08bPqsHnAP7DqmF3i3C17KHqEnaJtCLW
	rv7yMADc47wLHEqF56NOcdS8AkEtKwP4=
X-Gm-Gg: AR+sD11iYuAREPQH6z1i3/FAjqNayZ3PLnuHYgS5tCKqSTCOwg5tGU39hRD78bLVNJT
	eMKkvHnB7ecPmeMWG/5xZ2OVIWZNJS5+Cfad4FmyZIWy+yXOznYAdVLlzE2IpuugfoP1wNhERep
	zv7kVnSDxLgFPdLvZ1/deYpMIDhp18+YsCeyT5cAr2Ms95B8VVeBpnAZ2LwbKobWHsW2xyQigSh
	uWXragDI56EeuN8tAqXFZOs3TaQo9+BM7zdC/Lh6WqucpBGZNQwlLEEUfjd4JpQ51TL/7O7UkHO
	eFibtHsuJ88XulVMc1VNSy3NjTv+IjefBiCsTNZ8MP/OD/Z9T9QlBzvlYY5bb0DcgehAPZEzLxz
	yBDqWoHsuHJVmXLlS2rTiuz8Q1LdrzqyK5eJTqR1SF6FKho1MxrlzyMA2Al7h
X-Received: by 2002:a17:903:1104:b0:2c9:8287:fd0d with SMTP id
 d9443c01a7336-2d74df62ccemr115727945ad.3.1788001055774; Sat, 29 Aug 2026
 03:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com> <9a3eabd1-4057-45cf-99b9-9c3c1b6260d3@gtucker.io>
In-Reply-To: <9a3eabd1-4057-45cf-99b9-9c3c1b6260d3@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Aug 2026 12:57:22 +0200
X-Gm-Features: AcwNN1U4Xd-ZPEH0J5NkeG85FCsQEWIBZhyX8xsSVfYp0sl8uMCqeYTmtDyhT2w
Message-ID: <CANiq72m0eemCPbEAvZSC49OZHyaNvQgbMdSDphT01no1B+YWEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org, 
	"kernelci lists.linux.dev" <kernelci@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 11:02=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> See "bc20c56e98e0 docs: changes: better document Python needs"
>
> Also it's explained briefly in the docs here:
>
>    https://www.kernel.org/doc/html/latest/process/changes.html#python
>
> So I guess that if it's needed for at least one build configuration,
> then it's not optional anymore.

Yeah, that is the commit I was referring to, but I am not sure what
that commit meant, i.e. if that were the case, then e.g. Rust would be
mandatory too since it is required for at least one build
configuration... :)

I guess the commit was trying to say "used in enough places" or
perhaps "the default config of at least one architecture" or "some
`make` targets" or a combination of all those, but it is not clear.

Cheers,
Miguel
