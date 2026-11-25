Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648140;
	b=N1+NRlq0F6beX6uS2gYmnpIlDYfGzAs2imwXnocAIcuJV3meIu8fyRcypJp5y302ICD9
	 V3DXHmSvPyvlycPkEDndv3pQoWuNuK0eHr89AgW4PQGhEzQLfpa0OeLEtEfjVB87pS8qL
	 jcZSaRxI6iehlRGASzRhWitJGsk/QtZmS47DmwZAb+Q0MAzIbhN1eTlOce1KWAZFRnP2R
	 rMS0cpRw8n+VkFzU1hC0KYhodCnjoVgo2M1S7Lys8aFZ8zACoNtsu4gCTFzANvrEciIj6
	 gy9uO/4C3aqejorQYHRLUt2cqcmovCEEkw9F7y42WVNLstGP9S5RRP9OwEpdEYzU4LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
	b=nvZ19cKnDIz9IPaWfYQodIcgUIBk17fpmlmtkRGTvA2pdhM8YrFYTeiwWwx3Kmu9+vjo
	 UKWGLbVTn9RrhX8wz9YC5f1I5mBsCVJt6ZtrWBmqZx9b+3c89wiEefRqY84ejWQGo00Ns
	 nhemp1G6Wz98oVQg4Ym5vLlYtW8HtZofuks5c+3NOT5YUpE486oiF0JGn9xkiP8i+DuXX
	 vnttZRhcZYRfe/8GDTxkkJr+n4fTgYtDU5QWcW21iX2igXk/NQwmdwwWIAOcy+mwsGs6q
	 4mqN2JjixuK7iXoE9JwgeLneUtu8xzpGAJuWX9jQMFYnE0i3GW335o6gUJMBlIYF7RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgEQxPvq;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA232606A321
	for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 23:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA232606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgEQxPvq
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f045b921caso37523905ad.3
        for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 15:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648139; x=1796252939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
        b=MgEQxPvqyytLZXf90OJPdh9PK1QbYUQGR9tBs/gU/iq2JMuoIc1EOF5PMb/JixBK+Z
         wZdsRu1GceHsqwSdB+3O2/7Uf7ghDdLNUL7SLKmR8/BiYzlM1mkLX6XZUrB07Tev7973
         X7MksrtBfscb8nNYJbxGM+eNYzSr71x9jR0MLpzAgaxAa53nHoo9ysokjg+ydCbjgkum
         arsJzwe58DZENu8fxE6FjTT5rKBGlRJsyFCeIjUGG4w0BdBAA0Jpn1+K96zKAZvSAaz2
         90vgLS9ls0SHShj4sXXg5R8AEfgvAuPpE5qByrYdt2raTvSBo95lFHi8Jk2qURMPkz7v
         cZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648139; x=1796252939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
        b=GG5U+AI18rSj/U/s/IAXVQQeKEaZaVGem70ht6IXumENSs4+ncWIp9odsU+aVTsl/u
         wukBffVdNX0uTop01mZ0SWGFmgEWcslXGh/RpYPg1dzVibUmrRpLvjE//RN/TDZTAnmW
         hgqNU7qzpojmxzgDbJbYZ2CqRbkqImrXXlzYx8Fgvr8nWx9gQJjATKTivzsb8kVoEPwV
         dK3aQccCUIvdkDIFAhzCcMZbzFJ4PLGs6AYY5Tv9bQQpwc6GKLy//bQI9fe7tn4wEV6p
         fUo3Y+KICHRfchBMlxPChEVRZRvDq0OTj043K8Ad7vDi+8FFIJrXmxUOTV4zJvtclX3d
         mglg==
X-Forwarded-Encrypted: i=1; AL+hErE8u1DhbHtHmIwkq5TW3A+yoOZhEEeCMLq+u3CvqZFPH1KMYp0w2piJjhpiIw64gGmYwP5pXixuLac=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iUnN+YjW9O4f2zQ1izWNUxtvyRLO8x8CE/JzcAw1k98WojlmX
	5RbqCEM/spH5BM94ipV4HHEKCs239UKcSy/I97bbQofG8S9XydQ8WU3d
X-Gm-Gg: AZFdTZdf01XHQvHBBfchkdcidGAwlu68cpgfVzOHIWLUXI5dN6ygujYt68zVDqdX/rY
	h0rd57km+tHeL1/Xr8UoE33P0A19oRirXK5aSmp62REiPpioeGGZlcFHFjN9JbqMt48tU/Ok8JC
	Gl654W8kmkDDe/5x0HNMHa3263EYbBDmkfRIPjh1gRMA3zhfXw6dGgzxVXUuSrDQqnuPyQoTtB7
	5UpQv1p7XtPgTBYeZNw/2eIDc0azQ9ebXhogO5ad9w2W7droafc2kv7Jn8s+w1xB2fY/NQ6qWNB
	VciRKzQdu6YtUd2gaO30F+gEh9L950hv8ikKJ3oyIrK2RXBvL/YYUIlyfURkTcaNxgsA/iqNC6H
	olvzSBO3h9Y7zP6q/4jlYuaJhciHS5MDto0hilvjFwatyqUQKvQvOhjgp/FFRSScVF2bpse+hOo
	i3Mh2l+Oj01T9/tik38ySMadTCq/hQqVBBTcG4+spjxGaTjWSYoIJaIO3MnsCg5O27+Nu9zT7Y2
	v/aOQbGzoIN1liyoEdMNYUEQec2fMuCxgYF04V6XurObaN+3+JmO8amWeeB/9uykeYp2T4DL2xJ
	vTYv8CU/W4TBobeJRTnhLarJVxozjRD4SJw1LUKgKPL7eQnt
X-Received: by 2002:a17:903:19e7:b0:2ed:b7e4:f5b with SMTP id d9443c01a7336-2f03f18a7d9mr181302175ad.40.1795648139044;
        Wed, 25 Nov 2026 15:08:59 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm9395193a12.21.2026.11.25.15.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:08:57 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 78DBD420A76D; Thu, 26 Nov 2026 06:08:54 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:08:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 05/14] docs: security-bugs: explain how to send a fix
 that can be applied
Message-ID: <awdqgBF62SOKaU0Q@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-6-w@1wt.eu>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/uqKRyynA7J8RM0T"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-6-w@1wt.eu>

--/uqKRyynA7J8RM0T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:05PM +0100, Willy Tarreau wrote:
> +Most fixes sent along with reports cannot be applied as-is because they =
were
> +damaged by the mailer or lacking a commit message, forcing maintainers t=
o ask
> +for a resend. A fix must be applicable using ``git am``, which is most e=
asily
> +achieved by letting git produce and send the messages (see
> +Documentation/process/submitting-patches.rst).
> +
> +When the fix is meant to only be sent privately, the preferred method is=
 to
> +send the report as a cover letter of a series, followed by the fix::

Documentation/process/submitting-patches.rst guidelines also applies to
privately-sent fixes, no?

> +
> +  $ git format-patch --cover-letter -1
> +  (edit 0000-cover-letter.patch and replace the subject and text with the
> +   report's subject and text)
replace the subject and message body placeholder as appropriate for the rep=
ort

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/uqKRyynA7J8RM0T
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdqgAAKCRD2uYlJVVFO
o8cvAP0UI4UPI69NykSfDcgis1xBWe2etCvfNQGcwSBb/jIkFAEAk4tq4aFkzzMk
UKJQhOV/RP0fTwz7if/m457ISve37wU=
=72sa
-----END PGP SIGNATURE-----

--/uqKRyynA7J8RM0T--
