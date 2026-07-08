Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268DB242D7F
	for <workflows@vger.kernel.org>; Wed,  8 Jul 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515767; cv=pass; b=cuGUlf1Pj5DbdS+ly3/Lt5x5W6EZtwp5ktEQEU8d7mUhwuAoTtsrNOTXxaockpCEPf+e8xJrJhl+Y99y/hvJx0JCHcS1yqUo84zovTWf7qno0J6rXGCVXNB1hdYufI0VQoMhTe5OndjqeuVI36CM9E3W/UYpc/yHJzs7/93/Cvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515767; c=relaxed/simple;
	bh=01GSOieINClQbTWiNGIDEavqyXKAQTpjChNDJs64pCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gAln9cVm11F9uBjIX8teDPEwI7KjaSbzNG6MvoCC+rh5EMRmfGllm0HYjAbBBZA68gJ5g8GmFILumxq9KLeXMMV74Dyr1hkvDUXwdHBhY/FZtGtJJ7T6atp+/jchBWNhtaDe87g9AkOkCUTbhdnS6Beewexe0PRCVyr9r0FROgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZZI31/F; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZZI31/F"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so54398a91.2
        for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 06:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783515765; cv=none;
        d=google.com; s=arc-20260327;
        b=hN8fJiP8gS8gtwhLPPWhBq3CeFx3gFD9s6hqhk74YwIa8HLM95Xbl5ZBNIVgtkcISL
         s91XLDo2VXPn3n0rqgBwGOeNQs9vCtbwAANTI8gV30kDUjsozzXYDbtfPt0TEii73w7y
         3vXX/r3yX64e/H646sRhyjKQ7cKR/MNl+C5pHhxtC3ijHD9WrdmP6EyTzRqGynP4Bf3V
         8o6wSxtzsDiloFGa0xDk8m3njk0CyscLZNTGbbTO1GrfJdnVZSaNy2h4BWJthDdNTaWw
         th22V5my2f6EbhG+Wvzlq35TXw0ZFmBR0nugP9kzmbUUwjwoQ9LbbwLIU/3mATJJoIaq
         Zilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ffbj3vyfKfSu1/ovXdhyqJv0LJd9O4yZhbGsSBgFMUg=;
        fh=O6fIryCeNOs70UGipbSvufU1kuqMnjHQYZYxh/IxWhA=;
        b=sL91AZDVWG//ZyxRnZoFt9v9En2vhxVIi8ATeoVGApsfFeQW37hXSQL/uvuSFqyk48
         MiURiW9Y9ZZmoGRMpO31RJHwUZtvgAjSvNZBaKx+Bfcj+K1yTT7WvWNEv24jpeEtrBmg
         6Nc+/XfrRnNjOJpStqpsIwZeprP8mP1P0GlTvnzIvW/X0q0r1DnIpW3vs+S5hWSELBw9
         yXG1BY/Blp92MfkQ+9Gtx8iS7M49m8KE5k5uENjz8zbm8AWEltsWLmhh6mYuEfyYg2vO
         jPHk5vBFvIXVKEtHUqh09dmv2GrFFQQT7PaUAMAbK7apdAw3yq1EOMKMqgXsBHx6ks3q
         hOgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515765; x=1784120565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ffbj3vyfKfSu1/ovXdhyqJv0LJd9O4yZhbGsSBgFMUg=;
        b=CZZI31/FxNNpWtOly2DU0cXbcA+45474Qkg5GVMdjIxCS2OSchNs/Q0OhjpcEtZhOD
         inwHap9QQ6Rk9y+fHtPxiBYHoQDU3vtm7CWqCwBNgYEyJRCVEOa3RUN2E6ujqYp22y9B
         Mw+ZwHg4yseD3P5mGWFCKbfdJSRzaLpFMqloutDgjsaVT31q7IkFKP7NXiHqtskjsf7N
         tTc6vNeC7XGoSW084r+90OCPnkadmwy2AkcGHo35/LCUIbjtzc3gktWRTpkCa+/JMfIO
         lkgYLPJj6AIXlrlCTDKnt3p4zdevPYKCuW9eNcogHUp138Uy+0p1QSt/1dETv9dO2iud
         zy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515765; x=1784120565;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffbj3vyfKfSu1/ovXdhyqJv0LJd9O4yZhbGsSBgFMUg=;
        b=ILZ92issS3N+e+eP7SmGrpS6BXUXQXXhWmCaFAKHQHuIoeq4thWygoPEIDBDMWDLQZ
         8On3DZ1goiaMkT7vhrRivxs8GeQKZIXF52PEQ4xI9VXNpqKUDgX6Cjogn9x0xmA6+eti
         jumQa4l8B4FeaHfFNRoUqbQahz8DHG+7P5NPAHiPcK4ki3vjVu8NziK6JVW2YjRriSxx
         foPjub025GiEZwhSC8NWhjZIuZDSS7eYX4YU11ZDh5Z9caMRThx+P2JZ4HoAVMGRmRqp
         XAaIZ56o3ap5JFHPAuR3EJ3mdKZdDYfZ/15rQk04Ja9cTTFtXLurfBIYSm3YsKHaefVu
         +Jnw==
X-Forwarded-Encrypted: i=1; AHgh+Rov3erwZ0Jp7tiHxSFBgnK9DgbzAH5JDJVod87oVXZ9hFCpTNsCYK+P5KSbSCspHtBY8zktzb1fSSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRXlNZnGi3HvyNCg8Yy+Y6HLGE5GBggzCV2cFTe5D7BWKF4ID+
	yr5lXGIaGna3WbYBsGR/OOlc0r9o9tp3dPNIZPaw7mMoIjGE8FCDcEv8S/c81jFnPMp+Qvus7s9
	zE8AiF4k8dl/AXQUiANtezaIrwHFaEY836neE4I0=
X-Gm-Gg: AfdE7cm7cWfGpIAHHDMhBBk/9afY+evU8P0xGvCskCVQzggZ5uHs9Q9gIANatXnTeCs
	Dj+UijQgS2M+maOEzyO9DeUpzG8EmKcrWM8E41cAVKVtkrfDt+Vby3zvBtp8zyB7oAJ75u3MXf2
	YWZurX7dsMhtT+2U9kawrQXf8YaKLPAi5FXKfApQXa5HWwXOVYZVEsFaEFgRD5z1X1KZw/ALKAB
	o2yFSFXeYezfsyG3MBrHgILAixTSKo22P6kV0SkajiaWNIos3Gt/Zn60NVMwNKXjBaaYU3sWKE5
	wpx+1LX7tCPjv1qat+zRIRl1Xt2il9V1CPaU256Bo1opItfPjeHjT2iSdSgDw6eYGibGQgSXnNF
	iPRid2r01zhpY
X-Received: by 2002:a17:90b:568c:b0:381:16b0:55c5 with SMTP id
 98e67ed59e1d1-3893f97c879mr2063340a91.2.1783515764982; Wed, 08 Jul 2026
 06:02:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707082104.90951-1-harish.cs.ss24@gmail.com>
 <db94b1a3-cc1e-47e8-92ee-976400209a43@de.bosch.com> <7bcbb466-0c2e-41c5-9c85-8b4e73348d1b@de.bosch.com>
 <CAGjpMsQgjBLTMt3PU8FHokCOBWc59YFagSjqcE2ZJSBGixLGOA@mail.gmail.com> <CAGjpMsTvHHbfaGXDTK+pK9j59wpAx1zitfgRDeC1NAnbt2K67A@mail.gmail.com>
In-Reply-To: <CAGjpMsTvHHbfaGXDTK+pK9j59wpAx1zitfgRDeC1NAnbt2K67A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 15:02:29 +0200
X-Gm-Features: AVVi8CfG8PaAXSQQxyc-sE5YJS5cPaEgoiwxvzqNgWwMzRipNLGngs0fOznfSAA
Message-ID: <CANiq72k1kdv4R+QYyROpJmO6sZBASCh+RwYkoLZ=wf8zTyUrHg@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: warn on Rust unwrap and expect calls
To: Harish CS <harish.cs.ss24@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 2:38=E2=80=AFPM Harish CS <harish.cs.ss24@gmail.com>=
 wrote:
>
> Do you think using Clippy's existing semantic lints would be a better
> direction to solve this in the build time itself ? Or do you have another=
 approach in mind?

The most recent context about this is that we talked with upstream
Clippy in RustWeek about this again, and, bandwidth-allowing, I think
they are open to such lints.

In fact, for `// PANIC`, there is an open PR:

  https://github.com/rust-lang/rust-clippy/pull/15969

Helping test and review that one for the kernel use case would be
welcome, I would imagine, since getting lints right is harder than it
looks!

I have more context in the live list at:

  https://github.com/Rust-for-Linux/linux/issues/349

I hope that helps & thanks!

Cheers,
Miguel
