Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792516184;
	b=r65NLIkHzQi33yjlpSrq01tO/uLpd/dZxqAuqaUu2tzl6j1B0IkNkf8BibbISriTKNN/
	 Z36v20UPZjA3d4+oOcpCCTIBHDLTDStGI/ZlCr4Z97bUUstNZ5HI63VLqB1qKk52sBci2
	 RBFJHnUNYONbu1UGRa/tIXq5Q8BNOjungUM4+xIxYG/68UbDvRanP7NH8A2W0PPIrofWU
	 Bez7HI8rOJNdzlbj7GSO7inrith3JmzrgTdL8SRowXn78WUJoijvhTVdK5vgzhVmBOZOy
	 olnk+XgwrmlJcWtJXo3z22qkbYlCcvtKYuXZPfxbrrGlUMJfNj8hsZNpq8+/cQpJ+Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
	b=QCJ85qCeYgwwiKBFmIcr3exn1EC5iJlgz1OoqxU5AG1K9DsONESsjD3z/90YU3tZOFvX
	 fDE5JHIXTofvZhc7SqIRwm9+2oOi2UdOZ4xOp61+F+GfqU7WR3P0KFyHrBIIfBExtMgCw
	 YVE7QgW5sq/7g8uJZO7dxTiEkNBjjUmP+yqZ4/wkxCpAZaFzvH6gKhzDJrSOqG0jVHB4+
	 26bJPtL26hqLvBC7o+ZNCau+8v4xKa08LMztAnGfxrhidZprmVN5ekSJRgcr4YGX3BA+D
	 HCdE/+6AVZ2dFc8kO7UEkYw3KeMsX468waaW13w0CWv90uP422GDDvmnqSANkcsjhLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GgmF2Jax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C93606A31F
	for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 17:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C93606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GgmF2Jax
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34c522572bfso363799eec.3
        for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 10:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792516183; cv=none;
        d=google.com; s=arc-20260327;
        b=S4laRB6FKqgk63zn1mybIv6/EaBMzy7mxBxZCrj24mTsQFgoglycQm0gNxFxTJpx8q
         v8ltrlImNqMUcmpI2rqeOqjTZIoWupmEy4m8a+58u+itf4buNhZqbX9vnpeTOMnpDuTQ
         vjCsXw++IMTwWospVvOhP4KGtIqTt4Qjc45QemR4+HBQR38e4JImU+MrSbAdjJVUoYGO
         J5grxoSGYYN+oAy2XqmPpcGtReuN8XufUeXWkZa2U6im2LE48G6QD6pcOAr/Zx3S5FmO
         65dp79gizSLI0SP+jo1CTnl6y/GzmjEU39Uh4FODpjY6dZJfIZeL7IHmgFbI7VZEeek3
         uInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        fh=CA6xoPRPA+MiWlOCoYezSINIRLIWqg4hLh7aXFC09lI=;
        b=giJK+4nEUe4zJnQCPNXwMzNUOod3YVTg1CIgEVG0ysFqK8i9c82v2bht2W3W9chrbE
         zLtLsuo8QBbUqn8TKsl3tQBTT+zk92ttmV5yZ9HD6/ZsSgRcoZwz2R+4hTUyy36jhM/o
         aVDzleu10L/y1T1q+F+n5ar1KWxuK5eDCUFuZAHONJSHp+I0zq4IQX4tbmvAp+qjKVfn
         3Uu8xfqnro75ncouEj3s8l/SK6oZ4BknEVjafJYg2MCcbR66wrD9X55UlH3gjhqHERGa
         8MBYDSRmd32N7Xf8fb8y9AM5zYlkNqAtoodvwjRXKaiODN4xaQdtFt6vat6CNoLuXPlS
         verQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792516183; x=1793120983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=GgmF2JaxWihTIKDQ6w9Iw49mFFy5aK7i+arMpdqj1xFBZLC/BS6rk5OF/MK6uP3C5W
         Jm9AVWMUFJh71vwBZX3czhYiBhPmmlT5Kac9X/v+QcHpJQ8f9DqjtSVviuIYnrEbUEQN
         HrLBLhDBH6fz6JaVN/0P8fjbNrPFw2VkAC4oSASuN5StwnebufW+K5n02y4z1Brz8C2j
         Je7MfkrR4VD6tZWibyrGI9bieSv5thwGC5hCQFe3lz7lL1hplpRFHxXl1e6ZlXE0+nts
         pLDPKbetGl6E42S5j+URmNQBC5/Z5LZ9ilfOpLld+c9Fpb3jJggJWBhJRv1wg7lcyCL5
         xQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516183; x=1793120983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=o+Abye6ViQq1SywgUKYgB6gvsWaxsv73dq/63kkRcH1P06Vy3nfDYhnxpHTa/0ej0i
         n1Z6ZSHxpfDi7iU00ilbGAh/EJnXf0BCfvvz3or+5uaxt+MDurbM2qCqK6Sgg3vroc2I
         infoCehVmrNIVilDumUvIeHFaLoxnQzt/JKvU+L7y9QvRuGxhtKSUbnkAtqJSt5tzcfa
         ntUJMaHbtZewKGOdAGX96gtpetOqTZm39Zqi6dsYc4jYi63YrytmmgZi6IHKInUKfmWo
         Qf0C5dP32ozgaUjvRA3pQiNY8Zke3ZkHFTSwpJ3HXFV0+rMR/om7Zky41/DOr71MygOM
         dlvw==
X-Forwarded-Encrypted: i=1; AKwUvByoZdxhRl1ZrJfiI7J9nqyX02L+6QJ2YPEw21rGYP7NyMbQndviemsGmE2VHdUhorHuggc5qLQ3Cxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbpPoyO1qo7qhWFiKGXOJ31U3J5WYgzSoox9GGf+cJOhzrdhWB
	neVEEKwy5Te75it7O1vwpR7JlHcu/EB/3DSwKOv5KGMXghq1JKhRLso6P/Bw9oNFrs7IFxYDiZ6
	c4Ht39WPA7jsnfDIJrfjwzKsGxbZOmxo=
X-Gm-Gg: AYBFou3jj3mes9u8kvC7cT88WYSOyZ5q6NYmUbuHM36seH6NmSeanSHr5nNfVhZGgWj
	LBQd4B6oa8sNvaeFy19lMavJ6mS2t36CQTjPsHBfc25Mnc9D9w51AZE4ZsVaMSPoaD7vCBf3yAo
	AwQRzFSMtkeQb4fbwUXLRtZ/vOWX3PBOH0sYLG1ondAsK11OZK8Ps/7VyfGyaRb9PlphDQsRhgf
	zPpI5UowiwTcE/WO3Mm1uAz75MDsqGnJU0PxqLI20MefO9/GHYaHrvusCAxzdMrtcLwKpjbYuJ0
	3OCYqOGJuoquh4Qyc4rmmB86IsrOoh3YF9sn3yUu7rfedL+uS2dJL1KKiVj4Hcndh6uncYn31mK
	W8VasHaejVMWJagwoeKW/i3Xrq8CB328KlV7NVNbnBmpjQ+my+ux3LqkQVBxqTynba5IpTX7M9j
	drcYrJnENwbmly6+4smQ1oAc4rzt/+vWhYjqFHRGt8+VpLQ8lxc78=
X-Received: by 2002:a05:7301:da84:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3619b212ef3mr24985185eec.0.1792516182799; Tue, 20 Oct 2026
 10:09:42 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com> <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
In-Reply-To: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 19:09:28 +0200
X-Gm-Features: AclHuK9D4Eg255wKZ2sPBwolmAnynFBIgoIfmMAgFcQGyxFl5TrsNoPPIa_966w
Message-ID: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Happy to take it - but in the interest of avoiding conflicts, thought
> it might be better suited for the Rust (or Kbuild trees).

Same -- happy to take it too next cycle, whatever you prefer.

> Needs some -next time, too.
>
> If I don't hear otherwise, I'll pick it up later this week / next week.

Do you mean for this cycle? Linus may not like that, but up to you of cours=
e.

Cheers,
Miguel
