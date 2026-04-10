Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47EF3AA1A8;
	Fri, 10 Apr 2026 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808763; cv=none; b=daGtDaTWZOXRZWlo85UioaSx2fwbjIy5ZzJW/qrQpzngK5BIptZrQtr/ZylsDxWgckrNsXObiV5ho7SNBjstkuyOVtALeaTBsLV5WiEMeM/uAyZtPA08PQp/Xsp62MBG302NnJ1U44unwYc4LgPRO/meo7IqZe87gtKJZNRDJEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808763; c=relaxed/simple;
	bh=AaE5wKoj1tWdEOdCbB55qbf5ITjSzBLP7pwr1KwdqcE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k2uVb4V57csMUAkVBQ4pLJ4HpY2ihiKQ2rMnj7Iy5BqKvWgWJzbwSyVdojs8IoD6lZdpbKG7Rtf4BOrmUPKaWvzPT6/4yq9C+V55Gi3Gq8QihELC4XLhnOsc/xW0NeMTbdA+U9IDvnCPVgTKPjGkGNLQ7SQqvMYnYfBF+4to8+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqN3iDNG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqN3iDNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537F2C19421;
	Fri, 10 Apr 2026 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775808763;
	bh=AaE5wKoj1tWdEOdCbB55qbf5ITjSzBLP7pwr1KwdqcE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bqN3iDNG9uAfV4+wGEMpI2ij+F4JQTolNKyn4mo0GF4sqZiG7wUqn/z4aPWMY1tLT
	 BZyflCCYGnlQCiN9moUHnIGh0MmXZMgbZsqk1ljD/9w5GpJL41xqwwIwSpAd4srMXZ
	 z0M24zxLWmR5NZiFfmFOkASHigo4KFHz9bUsnt6dU10RXfzz3VGFRjHALavvKivHg4
	 xtj8shpyGOM7D46mJWX8/JtXyCuQWu5Ozg9EZ7vfpp2/NdD4ixOnJj0LGuYfoF0W4C
	 fEpAcgozA3j35QVFOGD/A/b4EiL9QCQNu0BHWBK87kh63v0QEVwmDA3GIPxY5QEuCy
	 1DwxTvpGXBMpQ==
Date: Fri, 10 Apr 2026 10:12:39 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
Subject: Re: maintainer profiles
Message-ID: <20260410101239.04c87f26@foz.lan>
In-Reply-To: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Apr 2026 17:18:39 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Hi,
> 
> Is there supposed to be a difference (or distinction) in the contents of
> 
> Documentation/process/maintainer-handbooks.rst
> and
> Documentation/maintainer/maintainer-entry-profile.rst
> ?
> 
> Can they be combined into one location?

Heh, from the 5 entries at maintainer-handbooks.rst:

   maintainer-netdev
   maintainer-soc
   maintainer-soc-clean-dts
   maintainer-tip
   maintainer-kvm-x86

we have 3 of them already there at maintainer-entry-profile.rst:

   $ grep process/ Documentation/maintainer/maintainer-entry-profile.rst
   ../process/maintainer-soc
   ../process/maintainer-soc-clean-dts
   ../process/maintainer-netdev

It sounds to me that moving maintainer-tip and maintainer-kvm-x86
to maintainer-entry-profile.rst would be enough to drop
maintainer-handbooks.rst, keeping them consolidated on a single
place.


Thanks,
Mauro
