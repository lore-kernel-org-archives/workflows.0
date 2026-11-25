Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623730;
	b=4V68O9EwGfx+z1mnNqTEaIontGEWAYL0vaOZoVNH3ppqyXYsqdCfPO5EdYk7UefW1lrZ
	 7ScuhlK9lxlPJ0M6h6bESpUnTlndeULPYkLqPS7zaLovt3Dtz9jb7HTwR7UQutOOWcqgZ
	 i6MQW0qqJei+qrMSBnIITqxojctsMlN9g5d1NwrMCnfs7qfgoBfkpp6j3jHboMOWBAZvr
	 B4ciZAJNJq0tRG+GRwH4Nb5ebrJCjRolZ913fBgRaYSayh+p7UTwti+DEx7vlUbvPj+QM
	 sKGeNGXYKv+PAHuV7GxqcShp5skpHcC77pNFm2ODwNdYE6IQdbfQnoGZq1wmv2Vkf4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623730;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=swORf6ZkbkssP3sk4dxly7lUzk15uKzGyli1ThbO+fI=;
	b=Sd9HD1Na0Tk2+RwP4XnvFI3wUyylQ+35JraUckwwJLgV2zzItzvIGIk+nEpRAY7SVwx/
	 +MvL5BKm7iHnW39mwHhO3bYXe0PPoScy4QEdJVBqbEBt8v74x7ibclrroEcPyAqxyzaOo
	 7sOTx9EqiFjbo70VC2n9WoprkssT0SC24CsgNKVpGUYncSMZRGAJUPt2uh9wrd0PvP9It
	 d8t2j993VuoF63/mD1K62FIlQAyY2BfBZ7qreaDerJWH1s16c2rRJLOzGgpq5UeCxEWpi
	 pO7cX7MRTiPKKhWNSXQsvFw4KKl68O5GAaeuovyVooeOgLyKBmXreUnF7x+9r7cDXsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=hrCp4Gix;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB790606A321;
	Wed, 25 Nov 2026 16:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB790606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=hrCp4Gix
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F294E410D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795623729; bh=swORf6ZkbkssP3sk4dxly7lUzk15uKzGyli1ThbO+fI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hrCp4GixfliWZptsIouALi5uTnRlTR43WsVChzdqYJjhiPfo2qStMeYnjkMD0IEtY
	 JV7RL3ZoL5VqOQVNa0D+T4u8NsW1/TVV5BO6sNvvXkM6DqjnTNvvggSZIp7hM1mhI9
	 gyG4qsvQ5AmhMVzVanc3GmdhzDrpBDyeWH7dtHNO6xm/qFV5FLC+mBslKeg/BHmkJG
	 81JYC/YF8HTMQCVRyUij6v5C2sLT5G1zuCZoHvv24ayQuhWOfGoBv3XJR/S4e3k04Q
	 1JRC6AuxEXgqTMXbGbul0SsnSY1nodrRXNFHdj0mRJy921f6rsxlYPmCBwpvleYyU5
	 fqzWgWDFYcNXQ==
Received: from localhost (unknown [205.220.129.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F294E410D3;
	Wed, 25 Nov 2026 16:22:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>
Subject: Re: [PATCH v2 00/14] security-bugs doc updates
In-Reply-To: <20261114190014.17826-1-w@1wt.eu>
References: <20261114190014.17826-1-w@1wt.eu>
Date: Wed, 25 Nov 2026 09:22:00 -0700
Message-ID: <87zeuwx4nr.fsf@trenco.lwn.net>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Willy Tarreau <w@1wt.eu> writes:

> Hi,
>
> Here comes the v2 of a new batch of updates for the security bugs
> doc, essentially to make it more readable and to address some of
> its apparent contradictions for those not reading it entirely. Some
> additions were made to explain how to send a patch and a reproducer
> separately, and to ask that first-time reporters send a single report
> at once first.

Would you like me to pick this up, or did you have another path in mind?

Thanks,

jon
