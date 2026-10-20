Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792513436;
	b=PwDvpPjHaFeIfuTxBeFvtn2IHuo5u012JNedzWcgDo7MjPr5DXkzJJfMcAgN2JSGFasO
	 iIPzGHRCSboL58gFp24KI6kor+//hwfkKYdKxsX/Wr9z7rGUzrtQjNL6fQaNWx1OADLmp
	 MlPHd3aptmsZq2VbWZ7sPVU62UBA1hbRkRGwmsZVgx2HLXHuzcgUjt+Njr1ka1fv/2d2d
	 wh44tvYLtAv5HioWaTuXHutQtMSl+l+7RLcRGXRLFxRKIY7oZW7JVjHnnT7wPlTNmhUq3
	 lTXHzOyv1Xhq55R7OhEW9jnCgOODBcZlvbPAlCihnAEHHsigcXn36YyD3nauINLe2Hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
	b=HrePe6OGLWKAddgqLxmYZPuUfRqqhq+NXr9DWGsWxILU9W20xkr0C0K7AJ1AHqkVRva7
	 hxNhJ8DRW4R0B0Wc5RnxF/84raWltzZ9ni+UI39zgfvkebOPCe0kfmMV7rAjmhwEn6iqX
	 sW5pbtrRB1E4a9AAaCThgt8HuMqhR+4GkUIz4f4Vl47tVWAhJLoaN951OUwCxT0S04u8k
	 yP9UoEIwU0fefDgHuA3MN7R/gs17PLHaT9DxbCYUnaWqzE2vP2FXTKNQNN8w9V24U7frc
	 CuqB5S0Gc9o0c8TdG7Vc902HuL24KQ3nNv0G7S4QYN6CUWMIhAAZDC5Fq1bQd8DkPBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nNJAyjCA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDC8606A31B
	for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 16:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFDC8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nNJAyjCA
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35159e0092aso417909eec.2
        for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 09:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792513435; cv=none;
        d=google.com; s=arc-20260327;
        b=rojR2sIz11TJNdo+ll9Jbx49h6vzNLVqTyLIqlI22/LFUe4fAGe6hj4ACj7QDL2vGF
         uNwJgGKvEoXFlsUNWtaG1KsJAzHactpYK14EBpP6UG+mC2VtJ35z8gWUPteNVBejm+Nu
         rgWSaCVhaIiyVAKqZuS4dZMXD7r7KxMv4tRGnH0iKX73UwcSVp2ANtvxQuz95s5MPQHt
         BEOsb5wC1N+doJtPzZk0cFMwzujT2IF9lvfqouS2OBGYiptyDE4IKAxycjvfN2BnZe2q
         H0ErlTgnNns6YQbjKIY7BTZ3DD7S+hNNBMG1zjynviVjdVW6w2++FHkcLR7K4KiF8zR9
         6brQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
        fh=0iuMrcMdg8tXlWgvHYpK/hCD8xifW7Euus6+zNWzIOE=;
        b=LfTtVv18RWv4nDkGOQsfrqk0pta0TVsgpg90tLjkvibw8ZEIIfV3qAGxA+c+jq7HGH
         fCYuI2RkgAozm+uLrvZfLDxTJz3mpxYEeTP7NM+6oJG9Luy+vIAIonCuMUm5J70Px8TU
         d/Kcke6BexRUZQ6BTbE+nuu/O3unl/e/rdLt5T0koeAInCa+/WKXJwtL5ZJIYpzhTKuz
         LJwqu8+Xbq9IUQYWbbQvRrMUtdLn35h5pVZ9Keoaye0QuiryFHRe9mhzrl10FF4DsCEK
         ChWLVGzjqf74Br1aOJ3CuiFEMlHAE6GS2a9CwzGAXWSwKdqSUCaY44lfqDAm5Y312gdw
         jQ3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792513435; x=1793118235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
        b=nNJAyjCA1cBtwTNsbNVgKbr42Fi2rxrR0AfP1I3EeNVC2GFOPbZzecenbHeKcp0763
         qlUTrtVJHbBz+kOuCzFOkQsDsTFo4W3CIiQxL+dXKPxYMKuPL9MGv3c2JIPRu/SGDt9t
         wRGSzHBAxq2gIQaYhRjmaoOVm6IvWlSd2hLmnzUoEEI7PDenhNsNoHVAnGWxBXqp6Z4G
         4GUiA+/JjyrtHoXM38Ik1qjtKbQ3+epNp+KSjx1NeRqAu3AI4TtVaPgITFEMLjJW3Rrz
         xE2SQkOuL1B20fBoNghYNTqsAnWLHLpp52JYVQUAcXlWWX+22A2MP8MlLzcVKezcpgIO
         5yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513435; x=1793118235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/TU1fx5Q7KS3NNxFTqPhkwN2RAGL4ewSYUEXSsjILU=;
        b=NIIhzCS7vDpG6J1dKP5N49SoQOLdxmffMlJ0dwW0mL54U3VhxZ0Y0uZMpLp709PSxZ
         fPxE1CkhBTSkiO7RpATaNZiPoPBFQnq8r0XwksfNB90O1156Rft+MtBxEF5gmpPDeZQh
         uwGVfUlIp76A4GyH9VRBolh5BtV8LPRDxiczdgHixKxJ+uVC4G/a3xW3o2IEGRb0rv49
         P0gMEy/O3asZOnlFDqaX9YR/sl5RhvYuKnVx2CrCh06z/DlLMPE+5gDbOhpdSk+W46Uo
         qvNc9X5fwi1Vo5NG7HeAMcYIDG9TtrMLNVDPoQ4lWIAgGo/jWdORgLEo5TPJNs756ykP
         M1Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwrnsJA14m/1Zej8ACAEZTlHQl1oAOXnkC4tQR1/NSH8a+vA0r6PrQ504KSioo9/VnpAathdZUw6ZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL67WRa2VDWORAe1AIBMw2Lcqc7VUDv2HxfGYsq4Lk72Swa+Z87
	GZ4SbhDgI8U+spfpu9GbKwRVF1IWEmKgk8Pc0AbmUMGZQHL78NML9vXsfGVGUrhcDnkdXjV2uks
	4hxvP6QP9M+ESrbUqXcoMAnX3Ill8qE0=
X-Gm-Gg: AYBFou3YG/5FBEUJaWSHEfuzLePOtZpISUhI9Po1NfXpBZyGJcV4vpWaJTvfZ835jYR
	LRmAi1p6jnUQ+sH2JylkOtgH8dOJOYW4bC4qyfAQYm0l4IjuHIIMTEZP+V8pr9t46WLDLaSCnxq
	LG3ioOrzg3jys9TgWsrUiEnqC6hE1vG7YBKTKVcHYu2lT/34uk5v+ySbMTVJFG+Y/mSU2naIhoB
	b3sfPF4UjHaEgExLgo/z08elGdtWYwWny+Eoa1MgPdDz4pWZGFeNWF7iG3PBBHJHcdlN5pN0h4v
	3s4gD1V/0xnS5RmOavlrZjxjhHGUBwCClyGQzImzeobjqM4P7pxubGKMcSEJSSAdOKu1dfypDYT
	7PK00DqqSl92+dvgg+yZAKaBklohzvw2WG/A/k1HdYBMgfp4+bS1RPg+Zb5kFcwPqhKWpmmW2F1
	Tu0hFCpNbS/z9LWOtewjgNPYQu2Rr2M6jbTqrnW2iPm2hZ2pUxlXtQk5WRSDa/edOGUKHH4mtl+
	1I3mEwUHxUBtlEsJyFXUYx6iOkHWnRm7vmN
X-Received: by 2002:a05:693c:409c:b0:35b:cb8a:8ce7 with SMTP id
 5a478bee46e88-361a06a6544mr28167645eec.1.1792513434719; Tue, 20 Oct 2026
 09:23:54 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016152828.3765695-1-sashal@kernel.org> <20261016160030.118973-1-ojeda@kernel.org>
 <20261020133156.3153106-1-sashal@kernel.org>
In-Reply-To: <20261020133156.3153106-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 18:23:41 +0200
X-Gm-Features: AclHuK9Pd22EdXpHIfqU5N44FLer_q0ZOIvVGA7MYMY15OzC7aZuyhpkAko0zds
Message-ID: <CANiq72n9q93=usmoPqey_ohnrZ_nQOwvZfPYLAXgb0h1-NSjEw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
To: Sasha Levin <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, corbet@lwn.net, error27@gmail.com, 
	geert@linux-m68k.org, gregkh@linuxfoundation.org, kees@kernel.org, 
	konstantin@linuxfoundation.org, ksummit@lists.linux.dev, 
	laurent.pinchart@ideasonboard.com, leon@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@leemhuis.info, mst@redhat.com, 
	rdunlap@infradead.org, skhan@linuxfoundation.org, stable@vger.kernel.org, 
	tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:31=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Could you send it as a separate patch to Greg and stable@? It doesn't rea=
lly
> depend on this series.
>
> 3/7 only drops rules that LLMs follow more strictly than the stable trees
> actually apply them. Adding a new kind of fix to the list is a policy
> change, and it should get its own review rather than ride along here.

Sounds good, I saw you split it in v4.

(To clarify, it is already the policy in practice and it is documented
on our side too; but I agree it is a good idea to discuss it
separately).

Cheers,
Miguel
