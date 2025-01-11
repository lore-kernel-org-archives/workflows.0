Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EF316F0E8;
	Sat, 11 Jan 2025 05:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736574537; cv=none; b=VQy16UbFH4bhKIusORbHQ7tcjwI+WLANwlrGh35ZmxUR3Rt1/xez9alMN2ZVwL7lozyWi0wNFwTmP1efKthy6+7zF33EQ4E+PXFc2mEff2jFf1JtZe7WgTgIKL9uklPI5DN6yT1fL+TXglz15FkgWv6/D5EcEMdKOZgemvXieHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736574537; c=relaxed/simple;
	bh=E8EtxLj+Y2T2FM7mXX6E0pKodKmAZNpba4AodRb//Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCHUOMKNEtLbAjJMWgfsWltHJaWzyPTmL0o2pgXec3nJbG747wQL3pqn6byZyybPKq6Iq4AlxS/mB8atQpWY18dTRuCNAo1iyhfn6PPOBf33WCkSgKz+Zm+t5JPj5aNkLopP/PkfRy7RNPw/wTOHrFbSwvnHzheJhld/xc9IIpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dh8r+PBC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dh8r+PBC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3D9C4CED2;
	Sat, 11 Jan 2025 05:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736574537;
	bh=E8EtxLj+Y2T2FM7mXX6E0pKodKmAZNpba4AodRb//Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dh8r+PBC6nag2RAOM9+Mte7QhNRGpMlfF3dRMO6hG6zQDCKJvPp9x2xhROMPo4UiI
	 ct9y3wO51WpGPzRPZu+SYtKhcgAXm7+q1pzYoivFYNvuiRtyVs3HD0LutijMXs4o8o
	 OsEs3xPmPtuLkW8TXWamEwGrajs3+70/QWCiNDGI=
Date: Sat, 11 Jan 2025 06:48:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Yeking@red54.com, kuba@kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <2025011115-energize-edge-c9c7@gregkh>
References: <tencent_6CF6E720909156A227D23AE8CFE4F9BA5D05@qq.com>
 <tencent_F8CFC8ED723F6E8103B4AF3D98D63D7F1F08@qq.com>
 <20250110080331.04645768@gandalf.local.home>
 <52541f79-ba1c-49c9-a576-45c3472d1c79@intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52541f79-ba1c-49c9-a576-45c3472d1c79@intel.com>

On Fri, Jan 10, 2025 at 04:21:35PM -0800, Jacob Keller wrote:
> However, all of the existing tooling we have for the kernel does not
> support the date, and I think its not worth trying to change it at this
> point. It doesn't make sense to break all this tooling for information
> which is accessible in other forms. Indeed, as long as the hash is
> sufficiently long, the change of a collision is minimal.

And if it isn't long enough, tools like:
	https://lore.kernel.org/r/20241226220555.3540872-1-sashal@kernel.org
can help figure it out as well.

thanks,

greg k-h
