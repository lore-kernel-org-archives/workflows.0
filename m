Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE6549B45C
	for <workflows@vger.kernel.org>; Mon, 12 Oct 2026 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818488; cv=pass; b=qSc74SIJAnCpHWwo+L8meej2xrshAbcKdjgAEbK14IPIBplvRA69ra9JpBg3TbmRQcNK9P5I9a0+cmsBH2ZXJuWf2ffiDn7d7ehcVe82FPvXBNGZOtZCidkWOHflGM+fSKlcMeewHTm2BT4EQKPQSJmheOuPP4ojmI1d1+XUT7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818488; c=relaxed/simple;
	bh=acXxdYNI6vj4GN6tEYHBYlbXzhzxGLnqPGYWn+EXNdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsEteM8OV/mjYEAmFKJl9/beSMtwifypBlOQtIAJmCnSHPNGoGXuLonW4Z4tNhjIEgM6+aswEHFUoF34UZbJ54lCmcDXYRU8YIxyC5aPD6jFlyXS6Z/ly5Sds+BohCQK3xTLbU0PkYduyxvck3KgQHz0Wrk//M3AWCK1K/f8IAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9UVbICO; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9UVbICO"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-313bab9cfe7so207687eec.3
        for <workflows@vger.kernel.org>; Mon, 12 Oct 2026 08:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818487; cv=none;
        d=google.com; s=arc-20260327;
        b=E58DhlgCL/oonYoDcabd3e7Z5wFNnCrs1bLKoBfFw4Jxfx7zgyuOC0Li5GZNlCLhyU
         syQho4cQkvOvspOHASdh5n0byqHvDv3po1Kpat4nhP1Dhy7W2YiRRSJ8Klye8w05ZWth
         ZKWyMBwQSYOrLmwuNT94edTSX09C9PfSz/CRgTuKpPImJ5hU+cWP5MDnM2UbYaoftdjk
         JcjWwG1JvxqQw9QJCV6K0rNajZ4d+ysLFhlKLnK1qsql+ioPGfrnmx3mixbJlYf+6Eb/
         ZggxZ3WOSzBy4Bl3CtriDSq23kl+76niPITa4u7x9MdCoR0yl31eVvQCZAuTUn659pAQ
         /1tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        fh=uFZf/n5GPiWkf8o83Ttt8oUdDYyFuWRFFsN+PVVh7u8=;
        b=nyCJCbTgQnYmVjpF9bsJNs6T/dTD9GgfwrYClIE1v2mVWdZPLIah6WONYK/DoRzVse
         rOyd8uDypvcbIDoeX+24E6sUFgiSkAZKXTsO/jXqEYe/3T2mlYpMVEo3xB74RfgVEfWW
         5YyypoJlUO1e4lrPAEHdiV0LGSKBR47dk78POINmpIqyEMBevwkZDlIkEj6xpoDtOo0x
         RhXle7iU5f++tEKIZQnFCTFm/8807dYNmLDRb3yxtgyK+au88MOCa/TT0CSI0q7Fpu7y
         LxoCJt3C47brMv7VqiWHfJLWkFDUi1YFtNtQa0AAt42TUQQXfbGnZrW/TI3HdV0mhfsr
         jwVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818487; x=1792423287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=V9UVbICO9Vb3G0dHVTiGb8S4WVniQxs6wmTmPNcXznYmsWz8kd1y+k31MFrHAf8vSr
         F/xu3g2v5JkYjvBeTbKIBSPdbOMtozVeZwNJe/sneeG+41EP6qmE4OlR8ZAft5Aw3GY8
         5QKTN1uz326YnQuvFOv/Dh4E5k3sn+Hyqa94/cPE5CWDlxlTTKSV8V6mLrRTozIwWcOH
         sqHovpjY6+6o70mawD+5zf6vV7GcNVQJpS1asU3zptVn8fG5vEtRCymo5tXcTJVdT/dg
         aOQpLbB7ySZzkjVQwzGgtzrtANP0OAgkCKgoS8RaZIK8+EPmpQgit/8WHVOlQr2kiIk8
         S0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818487; x=1792423287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=WfEF7BE/tgQVnQ2bwlSLWKk7iFtWXaQ9qflX+0rqqleCjYdivgfJjKY+hquuF1LH+x
         vR0VPcuxOshIe+u/b3JYjcMdXhGCtk4b+cr3dwSlc588xtExUkesXmI4thTcKZUO44iF
         x81EmrBImSYiUUIhYDP6mgEnSbUznpCyuc3ipyxZssQN9kzK1pLPZRUXu4s0Q6PS0Ewa
         g5rzTmFRs/1qTxgc0yvKSSZYLl8IyVY2csST+Ilke77P4si2G8o9pK9x0Dru/TEHChF6
         IG04JkqonKPdaNxp8LOfamaU+GSpiLrdVACJ7veUmu/brSARle5HjdShLOb8hmCG74oR
         9L4g==
X-Forwarded-Encrypted: i=1; AKwUvBxNCm+e4EphHMZ0pOwW+tMvmhy4ODfvzGZt065gcWIDU3s+e4dXmu0Wn3FOeUUuxkoDwYpjTlfHYVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI78lp7ElxX3p/cOUk8HYIRmpGXdcyFIU/1blrS450v6z+aMuuH
	eoAQJTx71bqQMKmEChZvhgw3HdOIAFNhYoYflCrRscvRo1usLrTsV24Zt09No262QSd+prCB24g
	EsObWmdnjLbg0jUy2PJbLuGFyfATSCZU=
X-Gm-Gg: AYBFou3xo88ffQMHyIYM0tnOgkcdoQOYFhVuAsoEJRzouqjdXoucOHVp0pe6LKLACDH
	DHWiVb3Sd3oaWouvsVUCgx84bd83om7t5suWGWn+KLW7pdR8mC6gZJRgp/DqDieQChiHLJl91Ez
	UrSAjH+YwC7CHHRdVX3l8yTu9LwHcxNhXrtcK3mI9GyuxmEziJ2MdudjbyfRCnZisvH+qmg6uus
	/k+YxBX4M9lbbQUyKZPHoAjX+BvE/80uXnIRftS8dcBQ1auytqvwlc1zO1OScmuZsYaPXj1Tnpn
	3f9ntxcium8KRV5tiuI0r1VfJZ67pjne3E56KINUGeSX5i3LP82utA1Q4UgiiljCHa9w1tSMqmk
	LK6QZvsZ/25uYb78a/lpd9WOMWMvBvysrrwArAN7OYmnhNcoyZjROzBIi9mqTcNIQXiaupYO/kH
	CopBhkgc8AlCgicoKVt+P1tOYQnTSZUiBmUbCsKyj5t/Om+UnS41U=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr22095379eec.0.1791818486595; Mon, 12 Oct 2026
 08:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com> <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
In-Reply-To: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 17:21:12 +0200
X-Gm-Features: AclHuK8qicd0EkbAG2tR809BSGa88U6FRkGTx1gJTbJF14aEuOf_oW-ieXqq320
Message-ID: <CANiq72=p6a=4K+8jhbm8=y8i_4yMszacK-fu91s3-Eg69ACejg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 5:16=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> Oops. I guess we'll make a v2.

Please also take the chance to use the kernel vertical imports style:

  https://docs.kernel.org/rust/coding-guidelines.html#imports

Thanks!

Cheers,
Miguel
