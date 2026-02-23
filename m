Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FCF371056;
	Mon, 23 Feb 2026 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771883817; cv=none; b=IZMONa5NzSFM3UoIvjcNdjL0kWKCpBpPKOhvNZBm9E4P+Y48bMw7ds170Crou39eyLtDSpST7c56+HJ1TGUMv/cRfURGvKNlA8ZDW9l6m65oJ5lbZGlf74d5wHK4r7XxK9rulE0cm9L6BJwdTvdwT4bJKmnd52XxJclxshI34yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771883817; c=relaxed/simple;
	bh=pXGC/cq1RIa+kosWyTBH56XxIsmLJCRt3EH2O+USob0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qyvMnCxfSkH3EgRcW/r+fb741ctqYcKqPeOdo1valw5Ag9WFzCqfoq6qYgVactCsjWu/0ijLD6gH9PMQ0cdOuxqgD5DFL2+1mSbfUyNIIcvu2id09jxUzU5AOthOYexhPPddGaOVK1YfaywnEj6MUxEsjiLQJrgrI4pKoT2mS5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Hd9ophFE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Hd9ophFE"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 226C540423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771883815; bh=TegdeLCjhtE2h6einga2Hyq6/L556fumxXo0tIT3FJA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Hd9ophFEX8eF9jKSNUsZCWxUOq6x4/ZFkZOmuxRcMy40ALlUeCZSf+zRfVhW0o9gX
	 vRo5HZKg2Hd5Pcy3PSuEEL/qKQsMoHc7YKRgbh4Y1X6RXDHwv1pazLpm+vgpPK7jhe
	 OEdowmpJCe1nSE/Q1crVq6+2tM1abiy75TpN7gmiv0KPfr9s0ROr8EfOR8uFp5RpW3
	 qnTOI9WQJ9EEuBbvnf1j/xdKVfTtwKAN0DO3wwWuLHV8vGodV3y/17dATmFSK36n86
	 F/nrl9fkBT9HeUfrdEFvX+KYlHn7kuFbLL/P0j64AtjWQ82Jb83EsQhIvCBffqnN2J
	 7StKAqdTcXs8A==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 226C540423;
	Mon, 23 Feb 2026 21:56:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Hans Anda <hansa@airmail.cc>, Collin Funk <collin.funk1@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans Anda <hansa@airmail.cc>
Subject: Re: [PATCH] scripts: sort ver_linux and list in changes.rst
In-Reply-To: <20260221152113.28322-2-hansa@airmail.cc>
References: <20260221152113.28322-2-hansa@airmail.cc>
Date: Mon, 23 Feb 2026 14:56:54 -0700
Message-ID: <87wm032kex.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hans Anda <hansa@airmail.cc> writes:

> It is a pain in the ass to compare the software versions on the running
> system (scripts/ver_linux) with the minimal required versions (changes.rst).
>
> Sort both lists alphabetically

So ... I suspect that the intent, in changes.rst anyway, was to list the
compilers first and group other stuff roughly by category.  But I agree
it's kind of a mess; if it's really by category, they should be
explicit.

If nobody screams, I am inclined to apply this change.  But ...

> Add missing tools in ver_linux
>  (bash, bc, bindgen, bindutils, btrfs, clang, e2fsck, awk, tar, gtags,
>   iptables, kmod, mcelog, mkimage, openssl, pahole, python, Rust, sphinx,
>   squashfs-tools, udev)
> Fix minor issues (add grub2)

...these are a separate change and should be in their own patch.

Thanks,

jon
