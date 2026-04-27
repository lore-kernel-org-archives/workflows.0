Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744B53CE4A3;
	Mon, 27 Apr 2026 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297742; cv=none; b=u5+6E+2OifQ3Kr+mHFriAGWtGdd9t40ive/9jTFV9sTaKBFtdKSNV0utO0xJCF7OqI+PxbPwYPKCmGaTStYei0TDUaAAxRwvCDASbDpZs3kW6AvbO7Jqp+eINctWIeQEMHgwjkRKG2mRNUMcbk1B6pA0v/Kkf1rw1y/tIlSS1vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297742; c=relaxed/simple;
	bh=yyCS3HMLIoLb8UXK81vqI45uKQfnxViIzSVtnPDQzBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3OwU4S0sFLqf+fRjBPk1TN07zeDnmcqGemu7RQKl4OLwp3YuInyYHz1hN+iqVw4KqXjdcgB+de3KBUkFf8qGAO9SggkTpGknG70sEN2v62vcRgiB+zfL+zBIGd3uwZLOzNi7Q50duHWk/75s8HJdx1gR6SeOHRq47QcPj9HGu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=EdvB9zSs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=avhiaPLu; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="EdvB9zSs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="avhiaPLu"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7F1FA14000CF;
	Mon, 27 Apr 2026 09:48:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 09:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777297739; x=1777384139; bh=Bq1Q4F363T
	nPBhAO5JVhpd6YzV3Oq2+nnRDKeowJk2M=; b=EdvB9zSstK0hYY9YL0ZKC3t4S9
	iHhgHbf4EJ87K1myqQ7ao6ngaZCG9TMAvgXedAugHnN7vrXpONiiP4k2+e0n+pzI
	iknVFRpha3ghJsdRZZglq0EuwZlLAuNV+WBH8BZ5Yj0fQ5FXaqpdrUscxou9fthv
	KkcqmhuXF0fNexu3mZpjfF12mE0F2FWymFT2faEsp+V5+Iu4+4k0ffKiQBfohQya
	wwKPYESxkxl1UbUwx4jw70z9afxrScSmJ2cHpAyueEtfL8Y9OobZrXNsfM8rKjSs
	Y+v6HczAhR4btoJwv5tFmRE/WO6dbk6j84nGsRHOQdy3kTCT5WDZSEhm5r/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777297739; x=1777384139; bh=Bq1Q4F363TnPBhAO5JVhpd6YzV3Oq2+nnRD
	KeowJk2M=; b=avhiaPLuV581Sm9UImAr+y3ShBO3iVo33fz/83oGYd5BIW5kBGG
	sdyZVJXvNhJKAOuL3kqapm+4EhfeTV8765BbKt4/YZeONwH15Aqc8bDY4o+p+Z98
	loegjuUUAWu6C0DJNUSD7NjATDZpUJuSAltkjgIcA78k6rcvFklaLDls6/FZ4b/W
	VGI2WTVyrPb/T8cw0p2Jv9idKEKOFgcnJisDj9HB+lypkKO0rFH5gfnVbXcaO0yZ
	azP+Cu4XuSeHGxNvMkLHdB0PRiLXZjsHq0ngiszZ7zJhJXeV1OfwcglZhzqrqcDT
	oIx+S8YzCgduq8oMnyS8Q2kBx3TclqO62IQ==
X-ME-Sender: <xms:S2nvaVLHQ-kkZmZA8ZuegawigcYamsJ4hf-NqO96AMtNY6ijXnX6OQ>
    <xme:S2nvaSEIwE6_uvNxwkdqHBwygvLpGWtyUNe7P1JrMkvvmmabK-TPP2qgCq1EKhZgf
    YB0kVKipdBWM8qrdMj128us6D8lxKWoMgUyG0Ur4Yneo9Jr9Y4>
X-ME-Received: <xmr:S2nvaeAhKgpqFuzvi4c2mZ-vnA_NVEhic5jk1an8KKetpYkMkYXaNEbbVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejkeekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peifsedufihtrdgvuhdprhgtphhtthhopehlvghonheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepshgvtghurhhithihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhr
    sggvtheslhifnhdrnhgvthdprhgtphhtthhopehskhhhrghnsehlihhnuhigfhhouhhnug
    grthhiohhnrdhorhhgpdhrtghpthhtohepfihorhhkfhhlohifshesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:S2nvaU12YVYshNYNdtdUvMR_GOHUE1iY7WWrsCSzZbTUGipcZoYlaw>
    <xmx:S2nvaTMvuuYA_Nv8fkRVoJY6Xo4Ax710B59FnRg-ooLhz3ID_wp65w>
    <xmx:S2nvaZ6p9omy3V9zjgKmLWnrtztXKhNyVj385R3muBYsQbq0cO_aDg>
    <xmx:S2nvaYbI834YCJq-CxrM93DzOGx8NuoJCruBonNdpnPRCxth2gAF_Q>
    <xmx:S2nvaVfF2l9-2tZHLspJoBsh0ciizeiXW4kpnkjCt3Iay5djgz0TQOqe>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Apr 2026 09:48:58 -0400 (EDT)
Date: Mon, 27 Apr 2026 07:48:23 -0600
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: security-bugs: explain what is and is
 not a security bug
Message-ID: <2026042753-ozone-jigsaw-4ad5@gregkh>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-3-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426163914.19449-3-w@1wt.eu>

On Sun, Apr 26, 2026 at 06:39:13PM +0200, Willy Tarreau wrote:
> +In the Linux kernel's threat model, an issue is **not** a security bug, and
> +should not be reported to the security list, when triggering it requires the
> +reporter to first undermine the system they are attacking.  This includes, but
> +is not limited to, behavior that only manifests after the administrator has
> +explicitly enabled it (loading a module, setting a sysctl, writing to a debugfs
> +knob, or otherwise using an interface documented as privileged or unsafe); bugs
> +reachable only through root or CAP_SYS_ADMIN or CAP_NET_ADMIN on a machine the
> +actor already fully controls, with no further privilege boundary being crossed;
> +prediction of random numbers that only works in a totally silent environment
> +(such as IP ID, TCP ports or sequence numbers that can only be guessed in a
> +lab), issues that appear only in debug, lockdep, KASAN, fault-injection,
> +CONFIG_NOMMU, or other developer-oriented kernel builds that are not intended
> +for production use; problems seen only under development simulators, emulators,
> +or fuzzing harnesses that present hardware or input states which cannot occur
> +on real systems; bugs that require modified or emulated hardware; missing
> +hardening or defence-in-depth suggestions with no demonstrable exploit path
> +(including local ASLR bypass); mounting file systems that would be fixed or
> +rejected by fsck; and bugs in out-of-tree modules or vendor forks, which should
> +be reported to the relevant vendor.  Functional and performance regressions,
> +and disagreements with documented kernel policy (for example, "root can load
> +modules"), are likewise ordinary bugs or feature requests rather than security
> +issues, and should be reported via the usual channels.

This is a great list to start with, but perhaps we should put it in list
form so that it's easier to read?

Also, I can see this turning into a separate document eventually as
different subsystems should have a chance to weigh in on what they
consider the threat model to be (like what the IB subsystem does which I
don't think you listed above, or the USB subsystem.)

thanks,

greg k-h
