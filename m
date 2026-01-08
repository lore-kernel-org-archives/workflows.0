Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A605313554
	for <workflows@vger.kernel.org>; Thu,  8 Jan 2026 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767896852; cv=none; b=u93OlB6jAIcGJqSYVg+r5UtNHowFM2Ik+SpMf4DtVR7Ys7axI/ggvN3TzpGY7CoX8xBzO6LrQW6ppMXP/kkvLIrJWcA3d3f2dF50IvuGIomI+4k5KAb6kwZcwgztxb++DBtNvDcuuCh7y3p6vGeKIVv02qK7i3TPiC4toDR5r+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767896852; c=relaxed/simple;
	bh=ckK6U5mDM1K5qj55d8UFpzpuNIXJuUo2Lt2ZIMdlu5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzuXATKeOyFfULFiB3802GGUeoP2iLVEKQRJVw6mNmCSHi7FZKWGxnh+57LQgsR0XMzYdpCRSzr7Nnia7kNIz1fL4IRa0dqPG/aeLJrWRMQmB6jaoH1AR/RDg0tpDNSHR0DCbbVVSSUai2bI5nQ32IEnRC9fc0IgGf2N052uFmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDiEA+g/; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDiEA+g/"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-122008e73c7so92246c88.2
        for <workflows@vger.kernel.org>; Thu, 08 Jan 2026 10:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767896849; x=1768501649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=denvpTaacLnNtz4te+wy3XScUNJz34hFVMFuAIppANs=;
        b=WDiEA+g/v7TTEKeEnnYcO0jM0mb8KtK8AhPZz7XX2hgDsunwskSccPYySw4fdYy6aP
         3YN06HE7dQKkTlnlU9CMVbqbGDGRIaef8OurVslouSesY4XdE/tm93AFwNmp0o+wlFk+
         VzPC17UokQ53XbcAO6peZYQMab2aBZv39abcxuU30HSOc+gCgh9PglkVZo7Wr2xohInw
         ND81kY+1tQyzwVmoINAVWjSEJOBLBc6QwZ4iqnEI1O/14TSysDCk88f8zFJ4mrEcjeju
         1fVUXoe4y15Ia5asfu4YdhVDJtp3P2SYp8H4ljSTzc0GpadBEbgrW/2jZTV487Vcw7Db
         5/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767896849; x=1768501649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=denvpTaacLnNtz4te+wy3XScUNJz34hFVMFuAIppANs=;
        b=cgs7nLfOnXbn4u3HJ5HH78JKnyEh1FBlcGuITJCTJk39hrRZEQwc8iUq6I9/VteroI
         N4lsIFEx5HEAKtKy6x1gq7wsoLkUXDw1AddOAbCnFnJ8wpVt7ouciUg2UQR3IGTOjjin
         AHALc3Aa1g1M0ibwK3KJkHlXFB0b5YSwcC0KYDoDu6E8yPyp6Iq2XHxn6eZZ2+LxmRdv
         0FWF2fAyQTINgVt3UYtYBCALcpV3CjZtIASvRifTXYe/XUYZH7WQOI/t7x11Av/rnKAd
         eSeQA0ZKbnV6BIDuWtg/bxIp65tk2oT8GPixkF5bWPtJZxttQ7ryfUtnd02lh2/9jT9f
         1Arw==
X-Forwarded-Encrypted: i=1; AJvYcCXvpsf9m7/zxCKXNNvRnaJEZH70h7U9OB43e7dEbP0YPiuLe5/KwE0u1s3Jh5mIznyLc7U5BrZTGVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNOTXzbdn9qtSDWYRncamRGLj6HQ/dZLFCrLA5j44ldn54k5pT
	2KA1lehmlkRuW3JKIwn9lC8UTT8y9jDWqYVFJVJgfLqquXmhfQ6pdfmdbbyXVHs9XHHJcz7GDzp
	W3acrDGuZSKubwQkxXqeBrs/FpxqTP/s=
X-Gm-Gg: AY/fxX4emtCs8r0FoHhlL5CszTsM8UeiTQldhcBpsZhhk0yT2hz5JQd2984Zrr1Ic0D
	jy+8AlV7Gz+m3uNhwDDmXbC9/FXSBbvnEy1oeMgjxK0UbolTUH+ClYWauNLrVIyi8/00AACkM6v
	V6Vl3KmH9nAhGSdDrHPsM1jWrwj/rKV9e1T1L3iOnb1hCMDo/O4e89NFC4rtqx7N20qxvHwOyRb
	uscNhNhpLLIkY+GDCxPTjsIS6uoXrHGxG26bENiUO9PFViTu34u386iR/I63qSSFWsHrDcasVuc
	BOGaNrxVVt7KLzjonwgqmzdjJFSIVM4s5PopaAcONy/64AKQDUpkdiauqTkB3tf/Y2/JWeMrtbb
	4fO+BR+5PnA==
X-Google-Smtp-Source: AGHT+IFoBjC4egDwXLOoj6ROkcmj08TNCPtcElGnZsp5q4/uA4anIrnFATecLsKaaDd4MJAoD0pG9LJKjUUjQDUZP70=
X-Received: by 2002:a05:7300:cc89:b0:2ae:5b31:5dc with SMTP id
 5a478bee46e88-2b17d336ad8mr2036772eec.7.1767896849443; Thu, 08 Jan 2026
 10:27:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local> <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local> <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local> <aV_eiRqUsK2KWkww@laps>
In-Reply-To: <aV_eiRqUsK2KWkww@laps>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 19:27:17 +0100
X-Gm-Features: AQt7F2qDCAUIhdH7pbK8poUr7bJ5y5pAZxzFEZz5_jeiBnU1RGtwdzg2LKky2yI
Message-ID: <CANiq72mw1bis7aE9b=Htx9=Sd9jZH1rJmew1xqhPiCWu=EyzPw@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Sasha Levin <sashal@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dave Hansen <dave.hansen@intel.com>, 
	Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	NeilBrown <neilb@ownmail.net>, "Theodore Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 5:42=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> We already have something like this in Documentation/process/howto.rst:
>
>    "Before making any actual modifications to the Linux kernel code, it i=
s
>     imperative to understand how the code in question works."

The patch already mentions something similar as well:

    Ensure that you understand your entire submission and are prepared
    to respond to review comments.

And then talks about the maintainers discretion and rejecting etc. at
the bullet list at the bottom, so it seems fairly clear to me, i.e.
that patches may get "rejected outright" if one cannot explain the
submitted series.

Cheers,
Miguel
