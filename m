Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792979227;
	b=s5ceI7/Yl60p5rtPjcfP8kNKC4nkERoBuF+/HOI6qMMCAYZA9rsYlhdum0asURcK7SH+
	 c7Td+iF/ov72o/F8oYih/2dFa77ZAlWItf6/ACjOJifZid47oDX5gREUCDzUAmw/S+IUv
	 U4q7tGSpX20LaLzthK1fS+0gtNItu3xMcVWoxYCQ3j2vcERWKBGILNW54/Eu/m7KNACuS
	 HtP7htP/Se+gNqBdKPH9QAZ7aeXeGLg0IiWOIadRsQAVHjSZCHFGEHwNVyHRDURO6t4GB
	 qn2iEgt+526drZ9mXv7cEpMW1k3kiWyqH2wzYVm+hUw3NADnsAeaS26ZFKDfR8Ja7GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
	b=S+uelxWvgfzvqfVDOpyI0GiWaoatwjvq5mwt74NK0WOizZcmuS6kfqRBdwXMNwxqGco8
	 OTG67L02kI027037WJnXbc5k2lzPaJs5B1a/kWxaa3JGHqVPtsmwn0KzCZZC8JEsdUK+G
	 NHe4ckDOW8+Up2umZqDNtGfjohWU3S4O0txGG6uMXDS3v6QVWOmsV4aclzxJs3xE9RMop
	 Kfq/I0p+jurgQ5Roy6XbiPq/v6qAy73JjAjYcWOspmtvl24UEjQC27r9QSTGFmVAH7ReM
	 zfrqcmuDTPBKtBlobCOlWgkNEEF3bj/OFvi9UZ3EmDV8/4tDevLwcPdWVxpyI88hJ/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k1mpcIkw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CE0606A31A
	for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 01:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31CE0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k1mpcIkw
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5365d725440so21428781cf.0
        for <workflows@vger.kernel.org>; Sun, 25 Oct 2026 18:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792979225; cv=none;
        d=google.com; s=arc-20260327;
        b=SII4R2rj/nCuJughgcFzbRws0atA7N8iLBygCJjXUUgLIbSYnsTHd2sB0UE6AYJgHc
         jPh7HtOLItMRHeW8rxWmv1vjrve1fwQELC88wvYjFxx1y8BqE+cYG82nWJ3mWmZNYWS8
         xSq2HoM5rLdcVwmkTU/5FWx3Z7ewNT1gRv3PZB4BanoadvCDvy2007GMIQDHsStbdfRz
         TRDl9hjildAQLC+TJt3DgaitHTirUGNESkpUlv8/KKCb9pfHxRDghHQqBHLDg/xsIO6r
         KFeWiDxtCOWq6NXUDp9DEACnJuB6obTdh1DYrGHaq+N5Nq9FLGT2qkZchFBtyuXiLlpG
         NCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        fh=MBQ2KMcvBJvanC3v3Md5Yt1rAFLWNVpgJqyAXvG82lE=;
        b=BV2hILiUTHiWHYpntYXvp02FbU2YIykmK3jnd1Dnxne2BGXu++CIQ4N1bG9PMUTGsW
         +ol8H2NJNAcOjNCCptSinOJPtVR5GRfWMzG31iODw4omLaLWhuYa8bKix5wxtIlOh1aH
         C0BUneyeGQojOna15YzRCfZGawolJ/Kr5GZKPSllVyEkoOEUmzIuhIu7xPeS/z+rcF/i
         SxEEqXmI0LOhQfn67rsKo7wVtUp6FfkX9kVNtkT6tCQ6oa02KgRc6gQkK/wrx5ZIpuvy
         hJA6SE6zYYxYMU/gunn8pPxxr2U+b4LI9V02vZUywCOHrNnO51EdeeVqYt9VODiCHpMv
         fDLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979225; x=1793584025; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        b=k1mpcIkwc1AXi9hb/mRiT22ro6h4FquWA+zMu8daRo1fzf4vKr5xnlakJSPrkylW+W
         BPZQZxoIuCc5J1ChOieBApdEw58hxaJegMTS+iftUo0MadwCUXP2cJ0B0whCpwZ+01Z1
         6IFaEE0VrSDv+WIDEJhZYV3SGEAowbSvdCmVw2p7/G1g4A78LmsmBHbkZqb0mvuv4dFC
         snhoe1grlRyEbSyotA1Q1Juwg3f2IhHshZugchVTm4VdHPkeEDh8eoNcsGy+04ZLaZg4
         bAOcnKmJU4DoOw6K23d2WUiJhP80dgi1VFqxTXSid1Z8+QvzOJfNJ36nkwBbaaX5ci4b
         ea6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979225; x=1793584025;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        b=TUpoCijnDe6hybqVJtUgUh24uTAfUACp2imLV/rVcbNnAzSFPtYs9b6Q4eK2caQ/yr
         oPB4TEDmnzdreRdejCmJjwoVNrhntsX8EQmy3xeIZi9IT/AlpnuSUX9FLsQSmlEp4+3x
         THaAam1+11mfYK33fk6opZiDV35yHKyPG6aM6mhs2c4XCzeYjpZMUdExXVnpgmLxW34s
         xy6M/ylVAZXUgqLC0OKUPJpv1/Ah/F7N7akeOpOwk7WEptFuajDOJhtrps9h/xQO8OF8
         fkxhDVV5HoOMNBTyTt3zM290m4r8GgP2mo9nbyhhGZ56cakefuKWPkA25BcGnEQ1FJsi
         wfXw==
X-Forwarded-Encrypted: i=1; AKwUvBx7f3tFgJ54uxczjZpTXtSfmJEgpJOs3N5+TLWRgL86y/3XCtNd4cKcCre/zhwNTMI+oxQGfKnyefw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbAHSkmrD46HZsblVHi8puWoci7CYvde0a5N8plX8KnzWz/xqy
	jcrw62cg3JQDO5Go9UsyWQL4vu1+3w4/FQZw56bk/soUBxnc7Nxpe3dzejaDHSrGY0vk4NXfMHz
	eNALBKDgdXo4bohS6LDBuc+3SUYuvz8uW5PNUsq1ojvIh
X-Gm-Gg: AYBFou1t4Gt28656CK95+NSMjLOIPcHnsAJIfLd+hl52dvZ+1BWsvnRdIbHFWycZVO6
	Tx41mzsFN+TIH1JF6LcNO2njmqOPgyJNWvhqxDHpfhpqbw/4eadyq8i5MOH6HmG5abIV/8e7ZtH
	034EopLhAnQdUodQG+wcIn494QoMjXxRPlILLPRy9vdFfmmUjUk6xZYkkzcmfg9PtPG8UIukKYs
	CdZvuph1t3f0KSZiFoVWT0E3hhgtBecAjnBSTUcIOg7Sr/Gw92VlCS61KECIVsdfj3fIENr99J+
	fvHsUfubZ+JrA9stk6z08g2Rrop2Q/2KY8hUfjeDk0rosgQl4TKREGEsQ9P4BTbZoG3ud4y3qns
	dl0JzZ4oOcNYbMkmsawYLHNOMe5i17Oum1q1Wxejahu32wcnhNBTGan1xQzuBqO80Ss/AuNpR+c
	9gjzz4v2ygqa+UTYu6zJ4QWFsa4vcdHyteCPGXv0JaZgnkwLwB3k4=
X-Received: by 2002:a05:622a:410e:b0:536:8ab3:cb01 with SMTP id
 d75a77b69052e-5383b5ebdc7mr72082141cf.26.1792979225119; Sun, 25 Oct 2026
 18:47:05 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179250646543.2190262.8632957027583518623@gmail.com>
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com> <179297820302.2598507.5712076951623488183@gmail.com>
In-Reply-To: <179297820302.2598507.5712076951623488183@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 22:46:53 -0300
X-Gm-Features: AclHuK9JgkkXlRw89V59iiWDYLD2QDEw_R-Zfh6fzK_yYgw4tVW-PfwZ2k_irrQ
Message-ID: <CAMAsx6dhGibUuwBzj6k+A3C4ZGAxPSdLyDbjNfawpKR0Ufj7nQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: kunit: document --summary and --failed options
To: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, 
	raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026, Eugenio Zuccarelli wrote:
> An LLM-based coding assistant helped draft these entries; I checked them
> against kunit.py and kunit_parser.py.

Hi Eugenio,

Resending to the list, as my previous reply went only to you.

Thanks for the v2. Moving the tool disclosure to the changelog looks
good to me and matches Documentation/process/generated-content.rst.
The two entries match kunit.py and kunit_parser.py: --summary only
prints the summary line, --failed prints only the failed or crashed
tests plus the summary, and both are ignored with --raw_output.

About the indentation: sorry for the noise in my review of v1. I
checked the raw v2 (the mbox from patchwork) instead of the copy in my
mail client, and the continuation lines of the new items do have two
spaces, aligned with the --json and --junit items. The one-space
indentation I saw was introduced on my side, not by your patch. Applied
to docs-next, "make SPHINXDIRS=dev-tools htmldocs" builds
run_wrapper.rst with no warnings, so please disregard my first point.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
