Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6A41F16B
	for <workflows@vger.kernel.org>; Mon,  9 Mar 2026 01:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773019366; cv=pass; b=a+D9fZoiX8wwKo3hgDuL30ipbGo0GM4pPmnH0JadDuFhtoFZ0vkxNgBwgkyTU5J3Z4CDzctly3Faj3QmuSfcmQJiXdWlCKxr8IoKeDzS1H/+K4VVq3z6snNSbGfqVkCywPBVRrpIhmuTH+6a6On9tsWtSvSNh/1eCqsVvDUREMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773019366; c=relaxed/simple;
	bh=B+NZvAdsTPOHEZcWxfpCFWLMOlEJi4VPfEOETliyfS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgO2UZ6hVNaXI1WXb7cQSP+EzNZrKVa/XpnIcfPBRnUosGe4kxE6uivErNodt7qKf/Q0ZcdVU+NWWTIVM2Mkag2OvdA+N9uaWKhN6KUI1EIUEl0rA7vKLrRVp0c5Ed1UZLxxNHrdp1zuDBBGheK1fLXSkz17kE/NJFuUXQOW/Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9ujmNrY; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9ujmNrY"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64cb577e79cso11808889d50.0
        for <workflows@vger.kernel.org>; Sun, 08 Mar 2026 18:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773019363; cv=none;
        d=google.com; s=arc-20240605;
        b=QJ0bWKOjBhSPUpxeDvEUDnsTDT8GQenSF8KiPkWZUM1jojODBT6IgF6l3gYxgQ58tg
         VenT9qpPqPTWNEAIr/y+hBJ4We/zLRH+cbp5fIAxvHkC/TA0urqPCmUpes48yCOtGET2
         /wDFIVEZzkwIdaE+40HY2txxk2xaD2T0/kMvdN0umQjOPoWq+qV2y+ygwKEIPrKB+qC2
         BLm4TzLBMTrZAaVjwOa5TP8S2NLbKFRkqZZGDlfh9/gyoHZMZWPYNbM+ZaGzptAyFNM9
         3KBSj6s2lNnvIM3gbwDdgVsVpl/v54PCrjvH+xY8TW3eAw9sonFQ0lqViPtE1j/3e6xE
         A22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N2EabwjW5WxPwX5Blg+/kL5UKsujhBTVnxIyzjEUEx4=;
        fh=OSSHC58fDAPjhcoRWlbXHWKcF6mjF6C5+P7HSaZlFQk=;
        b=jiCLUOcpg8iwvsP75ZXXPGfgAc+NUgD1BaeNq6torZtTFVT8IZF7IO4MqVDtTGjVjD
         0Op11/8fsN38O47oAuMUNFrx0mOx4gF8QnUG8rDHTq8CKFTt96WdGcpxjcso3vg4Fuiz
         S5LNo4Vp/XJeERnb+vnVsAvR1T3QypKAbM+o3EdertT36FMoniajd5g8HmR90XdWI2xr
         weroCj7n8pvE2Xjxwoy+CTkDWP5ItE9DWfXq+FxVD5JAxb5QD0ZR/pgnqLu94AApWVuR
         +w4KtrCfq8CENvWCn0H5sPEROxc51jeng1IwAmsjRdsxCRy6HxlKfZFrMGyrmmYXAXKf
         eiHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773019363; x=1773624163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2EabwjW5WxPwX5Blg+/kL5UKsujhBTVnxIyzjEUEx4=;
        b=S9ujmNrY6kvhPdJkKNlDrKxydO37LRXT7ecpFOXe69wG6UT7gZY3mkS/EN3R6dSlcr
         R+MhLyXS/gdt7mmnhCGWfgjRsqwxVKHPDPKR962L+ohRWDYypgwiPeGqbJMGqzu+SZPu
         H0JLfsDUckB4frkbbwgPvsYxY80jB4vp+9z5n3H+SPB+nXmU8fqkThjo49Wp3pCekdvo
         3jWPsMzIGtsZgOazdQAVcRUhyNLo5iU5IZzT4V41iYP/z8rR/2+mRz3bou2X8eOwIzqw
         oUROKN5T0mMKUP3EwsiWMvGWwnMvh9/l9/hOEFheWpPr5narXHPpz2T120n5eY6uy4wR
         6yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773019363; x=1773624163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2EabwjW5WxPwX5Blg+/kL5UKsujhBTVnxIyzjEUEx4=;
        b=ZcPifa1FtGMjdEr5P1Yd6I78llOQj6marX1sH9lrXqaFJW4Qcrb4d/ma/JRkvBejey
         SXrZrzgwqPyYDoqYbpNWSVtfp0PPDMs963bfV12UEZnbz5a4vo25mfHoo0Gefqsm6wVN
         zSSH8nWtkFEkGDBN9PSzC3/souvCGY6x4qRKo7Of0824cR9ZAyn6Vr0vM2Jguwh93NAg
         kYTMI7CeiJPIvSgCeYHAxiSMdaTtCmogNSgCFG2HD5Uo1cf76WBzpAGYQzB2uNOYudje
         w/r0BlrSFB7Snn2DJ7tuA86TLBSoiLU57GfNZ4nVHDa6SO9IPEMWR5xjHk6+txX5w7W3
         HVNw==
X-Forwarded-Encrypted: i=1; AJvYcCX6BGd7hqA6UHLHZ/CR6VMkJIYR15OOj0rkVE6gWFemraDr0HBb9rUsJ9IurJYLVXG6VpyuszoYNkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAp9vXPQbFIzlA6gF1djw+1z3/PRbIrYYnYS8OkIK/mP5U9xLm
	ZwpkLdeDdkjjGkKFFsVyx3NrYvO2CfJppA/T+pe+mWZyqga0GCrOEfwevkxifXmGWlH87tCpqIS
	dVo9fNazV+Od65vrR/Kpug40lZaEbodA=
X-Gm-Gg: ATEYQzySZah9U3Z7tA+BPV+MZACM+NajTrb4H1BECtDZvmKrNjo9GxXHNndldOWy0cK
	/GI+IzYrjxiWF1SkV3A9ImuDqw/TW6EHMlZlNZtmi/79lpdqzW2CQJCydI5s9XtrHOLXGtxYV9S
	f0FJRYeSd4ccl9W1jnXWaUZrN8ePENP7+q8W9+aohPLwRZmkAXrOLYe65235ch4TlR3wPfJJ/7F
	L640KUyyXO8/IZlH5WEH7WcWZgTrdlbEDlE5kRvjx1D7kVnmxGjBrULHJlao8K30ijkbOj9it+W
	IYRmwQ==
X-Received: by 2002:a05:690e:144c:b0:64d:294e:9924 with SMTP id
 956f58d0204a3-64d294f2d51mr2796898d50.86.1773019362840; Sun, 08 Mar 2026
 18:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308100851.341-1-tttturtleruss@gmail.com>
In-Reply-To: <20260308100851.341-1-tttturtleruss@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 9 Mar 2026 09:22:16 +0800
X-Gm-Features: AaiRm50wSmO0lVbz6Ja8d-X_hAJPknw6EK0FBsvvFyg25jIlfu5X_T3ch-YDw8s
Message-ID: <CAD-N9QV+xB+0zc2RM1rbO3L36FyFa7WLHZ+4vMgviGg717iTaA@mail.gmail.com>
Subject: Re: [PATCH] docs/dev-tools: fix a broken URL in dev-tools/coccinelle.rst
To: LIU Haoyang <tttturtleruss@gmail.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, cocci@inria.fr, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 6:09=E2=80=AFPM LIU Haoyang <tttturtleruss@gmail.com=
> wrote:
>
> The original supplemental documentation for coccicheck is
> https://bottest.wiki.kernel.org/coccicheck, which redirects to a not foun=
d page,
> thus change it to https://bottest.wiki.kernel.org/coccicheck.html,
> which adds a suffix to original URL to make it direct to the right page.
>

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
> ---
>  Documentation/dev-tools/coccinelle.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-t=
ools/coccinelle.rst
> index 2b942e3c8049..f73ccf5397f3 100644
> --- a/Documentation/dev-tools/coccinelle.rst
> +++ b/Documentation/dev-tools/coccinelle.rst
> @@ -61,7 +61,7 @@ Supplemental documentation
>
>  For supplemental documentation refer to the wiki:
>
> -https://bottest.wiki.kernel.org/coccicheck
> +https://bottest.wiki.kernel.org/coccicheck.html
>
>  The wiki documentation always refers to the linux-next version of the sc=
ript.
>
> --
> 2.53.0
>
>
