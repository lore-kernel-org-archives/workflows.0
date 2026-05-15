Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BC93655CC
	for <workflows@vger.kernel.org>; Fri, 15 May 2026 06:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828384; cv=pass; b=UdpYl8i8n+u40jPC8u+jwa6801kCT0HC9XXdtwn7njHb3GHnf85gcu5/PFVXdwQYHBFfQLFJl8XZlQEagpwIvIpTuHIDaJj4zlr2NEQwD4bR+iKUkLBQYU333003EG99HfxMsQcWAPwV2rAWIFdvtMVLlantTGapQj3EyEEiwGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828384; c=relaxed/simple;
	bh=JDbfLIM1ZnhgN+J+eN77ssFR5w5fCeI1m7dHPY9ob8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SyT+ODcShn4vzvyUdNeE4YuAnFrWCV3zrxQLhfqWgDFo4nGrtpgPnzdYFzDEUx0p9oGHXsOy0oBGourb2qK1TFrdkxfQMkodKjbZTsP5S7a9lnrb++N85JZS8ADqD58x+zqHf7yHI9RWRmbWZKJ/JBX8y70zpUBpqL3zd6X72Eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pU4zMb25; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pU4zMb25"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bb91b426e40so1457556766b.0
        for <workflows@vger.kernel.org>; Thu, 14 May 2026 23:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778828379; cv=none;
        d=google.com; s=arc-20240605;
        b=FghUItGaN4zU5cLsdQmI81N3G3/9dNlZ0r+8OhZHy51irNAAQi4D7cPxd0dJj024Fy
         AxBIYmBNhAYvtcMkmK5nKTpmsHZzwuN1zrB4JmPVYk/ijPWY7OYaYuYcQuFZ268COrLg
         G+sBVhjnim3YU9EMzEFWAjmHEPYiuXTNy2CKP87FFIFE1ZvwzVERFdxh8sjzbdKeLpBZ
         gvsMsc/yXDTHTaLX30KKWso8DFLAI8/4ghqhR/IfqmW7j/Ax5xOGng+OtrtHV767jorz
         VQsvMNnWSbOXH2XKKZrJ/SdxInOzUR6/gvGPbmVY5Z/5X6G1+UGFlZdMMVmtp880x1PN
         wGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JDbfLIM1ZnhgN+J+eN77ssFR5w5fCeI1m7dHPY9ob8Q=;
        fh=95hF57lH5uf51bHmep8DZD9UPhhIrUTf3/F5ILtRo68=;
        b=I6xO9bJ59l8hekhnzHo1Fgui02YrkI/LeDhMso3NpyHUhpMNG7KfSfNMPkz9K9gL2d
         DNKY3Fb9MTbMkx3Li8iIspPVwR/QrUGtqB3Ap99Tz7zIgFnUiq2a/mfSfaYWP2SBBIui
         X3++q9hdBjptHHZN+B8evHM2kinjsXBg4OUR4oOxS8s9l5ItbSQ3SLvJ1bnsVgRdQH1+
         Kqy8W3h0+WROnORmCjUuHF7LAMFSlcFLZ4vduyh1LkUK/OuxU5/eUXbRl7Dp65aMVgYI
         xje/mppZ72tuWvDttjOqXWjqa/R3oIax6J1UP8ibMQFBT7hfMj2PhjzRweMmOK2Lab3g
         zo/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778828379; x=1779433179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDbfLIM1ZnhgN+J+eN77ssFR5w5fCeI1m7dHPY9ob8Q=;
        b=pU4zMb25vGfonGv1bfGoLMTbqM2K3M5qWGRWwv0bl92OITASUCEX9weV/QwY2zaryn
         AL+xmAxui7csESfSi1qv5ORmyIWDP4bFOpyAPaGzUjhRWfNaUDN/1mrTX16RhK1xMwGs
         J+tgX5ocquusZyreYsfx63TYd3CGFbFx5NFBvDHND56ipNMXJP5zaEFbvDbLxBy3QB19
         iMmdmCAN7KZkeD59tr0Tl/BmBjnrzo5tmNkLlpu+NhFAQ0ORnmjg5I2cPKcl+oDhuW8y
         ZUfibgdIALpvuXsgw2Z/cCvvFBHqY6Ryi/TJ+qTqwdV8A3JnHrSWpO6juv4bvw7/d1NX
         fCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778828379; x=1779433179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JDbfLIM1ZnhgN+J+eN77ssFR5w5fCeI1m7dHPY9ob8Q=;
        b=cAop1TcXsl3MhaMH0VOf9NTc3SutK2Rnnc7rNqqp8uGcZu/IChsve8EYh7XCXAwdBm
         KVm2yuIc0IZ/kVk/n+TDtcvG+38on/rip/YUpPHXtGc2TvRoCkYzh4VVu5DQRlS9VFIe
         NdXZmL04wJhzx60JPQlXQY0fjWeC2hTnioOltl1U0wTyozjcWGEpVJWN6vOe59INgn1X
         ho6e4wWalK+9F15JpJ9RMzAVefipHdXxDLF12dyvxDU+fEOt1jz5Oodo5Zsmv1IRKD9d
         4LLrNx4bc6aNfQO7mgLUxg1XHCzDv0FS+welK75NBaq8LXvSDG2eoIxrWPhtCSgVeqO7
         fUog==
X-Forwarded-Encrypted: i=1; AFNElJ/92wpKiayeSFegsWUT/D7nvzl9QIA/nHJeim/gAJzTKhdNXq3WORukJhX6jFSBQbYJZlNZlSR8220=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBq4lHZxrE20b1RIyfVCLpSBqnW8jQK9rI2MtMXkabQwZu9gr+
	+17z/fKG6fay9kb/QcmVjkmli/jqlYTVkhorMc70OtqR6fGnbi4EZ9M7k2rRoJTPxHffgPfYd7E
	DjYI2pubwIyjER/2ZhQobb6H7fsPDvvU=
X-Gm-Gg: Acq92OFmNhgkVVcRIJN56vDhA72EEgp0y1zlEDBGXkFowX3Z+jff0AsdJ+0WXzhEggG
	xWzZ4DUv54wQeXcbdQlJN6n2SA5KyJOQgJ2eJ1MjqqytGWtRdoYgmqAsxJrC12xwgfizsdtoWLR
	gnzftrWgAehamMK13YXEPaoiHcw5AlmgV9KYxjyCT2e5FHXBMlqxLljRgYeZn3SjSWVJgZ/MVnn
	XeIOgcTv4JuXuv/iYSw1M36VNehBzBcTIZsibyoErSwGecqmUP8gvc1TSjSl7Cvf7/Ez343LAeU
	XI2OdiCOflEKytTRVGIqNE+xAx+l9TCnEb6PUH6oZ6XDrYfphRs3mvN3o50r63LachEbSIS4FFl
	AqZ9GIBA9a1AvjDBXqQ==
X-Received: by 2002:a17:907:94c8:b0:bab:d8e9:53a7 with SMTP id
 a640c23a62f3a-bd5178fa6eemr136797866b.29.1778828378753; Thu, 14 May 2026
 23:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org> <20260514163033.108009-2-manuelebner@mailbox.org>
In-Reply-To: <20260514163033.108009-2-manuelebner@mailbox.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 May 2026 09:59:02 +0300
X-Gm-Features: AVHnY4IPTVxZUqcM-DpNgcbFy7wvlxV0J4J7WeOMuaa-GmnLyF-Unq5lKTxG9wE
Message-ID: <CAHp75VcTjiPHaWMX8oNKN2M2GS+wZ3KyRRUB+sC+VsbE2EsS-A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	David Laight <david.laight.linux@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 7:32=E2=80=AFPM Manuel Ebner <manuelebner@mailbox.o=
rg> wrote:
>
> add kernel-doc comment to strlcat() function definitions

Add
definitions.

...

> --- a/tools/include/nolibc/string.h
> +++ b/tools/include/nolibc/string.h

I probably missed a discussion, but nolibc is not a kernel binary,
they can choose themselves what to use, no?

--=20
With Best Regards,
Andy Shevchenko
