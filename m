Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8FE1BD9DD;
	Sun, 12 Jan 2025 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736699492; cv=none; b=D2PB8YTTXl2zgvXNBYmR6J53RJzzOWqvv0SHH/DB3JD6XZdRrHPosz8yqkB9rP5YWCGi7cR0cm6eX8YwqZBXWheTYIL2y6UL7USa/dxkKZH2VvlkRtekX3h8ac3g9Yc2vkpi3w7a6Llnytypm8/atWlPVRh5X67iS504bo+f0E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736699492; c=relaxed/simple;
	bh=sNhMBhyL5w4a7WceXmC4Y8SPg2Un1Y6l1A1LurqGZGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+2T54KQbpLU76R9Rkbmeq1joxJ7jYDJBnF/ohuzDg5W4yG7kxzITGR1oEb40Wcf+qNyBBt9zW007KSklYh8C9dh2NqjRz+agh52Kyt5MsxXkv47ZLTdVV/gtbMawTfuK5d8rIWumFSrxWX8vOu+i3P2tbmAji8n3HT6pt+kcF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGFssvXG; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGFssvXG"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ef6ee55225so753587a91.0;
        Sun, 12 Jan 2025 08:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736699491; x=1737304291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJZjA7ddXBzmeJP3TDfTjmPEzR8WOsxrozUuiF8qE4w=;
        b=AGFssvXGxyCuesyLRXT1GfYf+eUFGseDOS0khyC+XZ1f0q+4C9Fxb67oxzUstlZG3A
         zV+V28InWZwQV70XpOfksa5d0cy47fZTiWse828HtwYI/RCxqcRzPWWTAV+pJg3spKgu
         M4iIbWRMOj5tvTjWLcsmOUn6epvw+/j6QBVv43HleRXvxLSB7nhtdN4awLiAf4OXvLwX
         i/ceVPwkuEPPr60zjKbhYj1PBSMiN1QYNoc12DMVY5IFCcLL9rpdILJEWp83YAkr+tLQ
         rlkQZH37egm4AXBRnsSoMzctjPAhWdxb5U9X10pJvaFw+8dSGlpsCu+sjhvUCT9caDzh
         2zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736699491; x=1737304291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJZjA7ddXBzmeJP3TDfTjmPEzR8WOsxrozUuiF8qE4w=;
        b=wYhC48T2ddUaJcEfT0v6WkXG0dXJ8dCgWP7jotUFu8srsb6U/3KVIEBWG113JtsspW
         UaOqTzh+Gn4rf5LjEbTsWmDoDJQ/LTSPP3XoqHY+s5hRHIxpQ/PzTJ3mBGYKf9s6rzv1
         hPRDtwx6u+QOgoYi1BPjN6tP/tmv+qr3UG2M2cnXMhTnmxNGx7bostI9H6RaxQHgn8Cr
         whPjdnXcgBI8WQtIyCSPKP8tSCOhq6cKRJiudj1T3fjspmfP3AkUTMJ7IDCJg9Tm5yKj
         Lr8C1PqbrYlTtxEurlfkNRCvNjhan6WdMV+BMfjsGfJKuucQOMFH6PluIvtxLwFUMYjd
         P3FA==
X-Forwarded-Encrypted: i=1; AJvYcCUHkZYsG/dU1wUtbTZg7w208o2jChYAhE1WXpgXxCyWfuC+5m3aXfqZ9MLByHSWMi6MToUCNyRytERlckC5@vger.kernel.org, AJvYcCWOfBZ4p2TFt8mus5iY2MTFEBuwiGp4EBQ7qaQ6kiHtEOhjqScaZsnOVHu9JI6WBP4JKxmnfylv8nHC@vger.kernel.org, AJvYcCXB/ccLF5mnb0gnPEGQtO8ptFwTK62ZAmZCHC+BS6PRYso+3bR9anZtPo138R0zFzYKfF1p2NrNUbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN6ldwp0rvl5guhC3Y+WQFmflCFwN/86ypLkP6SYA+AYirUYGI
	zMgVTLtWR9SffvWAO9EE2rkUKAyFtd7WUKLU7ohvBPGwqOpkAW2uwljuAEUWiABeUWi/JEwadJn
	iXk68aCHsjbmtmlN2jZFJN/ZSb2c=
X-Gm-Gg: ASbGncustwDqhGRGQ2wRK1crJuek5/ypENzLkXZceYcaM5rW5zMlddPb60w3G2FfSiD
	82fYjuyPKIlnC3xIPhH4/4VwvGDSQoLcNZltdpw==
X-Google-Smtp-Source: AGHT+IFvatJdCQrTlZmglBTHxzU5RtyJmkJmF3ypBMnAlLF8B+1fvlW2IreBFOBIelSfosCLqmMIfHeK3qQGFTqGaRg=
X-Received: by 2002:a17:90a:d645:b0:2f4:f7f8:f70b with SMTP id
 98e67ed59e1d1-2f5490fafb1mr10145767a91.5.1736699490780; Sun, 12 Jan 2025
 08:31:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250112152946.761150-1-ojeda@kernel.org> <20250112152946.761150-3-ojeda@kernel.org>
 <CAEg-Je81VAYecajUjYVJKBJUT+YqKemWsWEoWFgOcF=vtfPRPw@mail.gmail.com>
In-Reply-To: <CAEg-Je81VAYecajUjYVJKBJUT+YqKemWsWEoWFgOcF=vtfPRPw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 12 Jan 2025 17:31:18 +0100
X-Gm-Features: AbW1kvbRZqfo4lkp-4yUh14_r0u0RWQWyiMu2o_Vji7wu_AsRhSzINSQxGt7nXE
Message-ID: <CANiq72kQOrvi5=1RUScEpov79RNzA3vna9KW6MoYmj8XJZhpQQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs: submitting-patches: clarify difference between
 Acked-by and Reviewed-by
To: Neal Gompa <neal@gompa.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	tech-board@groups.linuxfoundation.org, Steven Rostedt <rostedt@goodmis.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, 
	"Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 4:51=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> This doesn't make sense as a distinction. What defines "thoroughly"?

It is a call, but when you give a Reviewed-by, it at least includes
what the "Reviewer's statement of oversight" mentions, unlike an
Acked-by.

> To be honest, I think you should go the other way and become okay with
> people sending Reviewed-by tags when people have looked over a patch
> and consider it good to land.

I am not sure what you mean. It is OK for people to send Reviewed-by
tags. The original discussion was about Acked-by because that is the
one that was usually used by maintainers only.

If what you mean is that Reviewed-by should not require an actual
review, then that is not the purpose of the tag. Please see the
"Reviewer's statement of oversight" -- its first bullet says:

     (a) I have carried out a technical review of this patch to
         evaluate its appropriateness and readiness for inclusion into
         the mainline kernel.

> To me, Acked-by mostly makes sense as a tag for people who *won't*
> review the code, not for those who *will*. Blending Acked-by and
> Reviewed-by just creates confusion.

The sentence about "thoroughly reviewing" in this patch is an example,
not the only use case. The next sentence gives another example that
explicitly says "may not have carried out a technical review".

This series tries to, precisely, widen the use cases of Acked-by and
explain those, so that it can be used by others who have not actually
carried out a technical review. Still, it is not meant to be used
randomly -- one is supposed to be a stakeholder in some way (please
see the previous patch).

Thanks for the quick review!

Cheers,
Miguel
