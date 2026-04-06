Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8DF3019BA;
	Mon,  6 Apr 2026 20:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775507693; cv=none; b=OMNjZaX5fABV5gxXxLVtgOzARqtyKcMn0G6+mHjR5Nf9k13UYxKT1ZIDIyffbnl/cO6TbSaM7tccTSXxo5rZoD3pBkht2YbhryODeRcq8KMFuNmL9PwKKHnjluV/+qCI0Ic4JqVaHqjiCiqwJAEk1dU6hOoSTO/Cxd49hCfo4/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775507693; c=relaxed/simple;
	bh=jCApDGrShRfwr3Znnb/yDkcIq8ZoRB0I0fZMlaUyMuA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nTAPLc3gHGEZOBK17UdIAM5NFKpfPYabJmXMD9OYiqn3dQYlX0wY6XJHrzCixGkGnJUZ4Xyki5QsruoyYM7BX3TVR9phW4DlsDiNHePpnSAJ7kGKUSDanYzeC55jEkpuViIDOt3Smdwvm4mOhHi0IjNRhQEHSi/8GLu47zKDR+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 2E68FE197F;
	Mon,  6 Apr 2026 20:34:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 9616220020;
	Mon,  6 Apr 2026 20:34:41 +0000 (UTC)
Message-ID: <18c7f51cebe2c15177564895322d0116c9ed9497.camel@perches.com>
Subject: Re: [PATCH] checkpatch: add --json output mode
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <mricon@kernel.org>, Sasha Levin <sashal@kernel.org>
Cc: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, apw@canonical.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 06 Apr 2026 13:34:40 -0700
In-Reply-To: <20260406-futuristic-lilac-gerbil-6ef4a5@lemur>
References: <20260406170039.4034716-1-sashal@kernel.org>
	 <20260406-true-whippet-of-luck-d3c2ba@lemur> <adQF8LoUf4YH7F98@laps>
	 <20260406-futuristic-lilac-gerbil-6ef4a5@lemur>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: epfsbzyx588g465zzmpuhq165ki6a3qx
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 9616220020
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/0JHZvPb0Km2xqo6zWPZSD0nLrqV6vjlM=
X-HE-Tag: 1775507681-550611
X-HE-Meta: U2FsdGVkX18fWGNMBKyxh960tpbHZuIJ/LP+AJ/81fixh/Ducb5/jqSPsHFwwm8sNv7pbF0BFaYyCKGtirMef050VlcyeKfy7Gb7/RIpmgqdmvBhWVjOYNClOa2eLpq32EqgCJCrAOJYPoAXdwe/cY9/MLgedZQjmMjArtcpGepKwhm5UVD0cwTmUL3sX9/CU6OTUZ5YZlb2ZSVRNZgTHAFi6vBrgiev6tqAMY8OZifoHPDuhc4I5oxmHMrw2lXDhB9P7yclCbyCR3S/20kA3WJbB91V6jDLzA68f0aIfWypRAJypqPp7sOK1w/WvAJ4zeN07sSPvXxyURCXArhNUdatuwAEawz9

On Mon, 2026-04-06 at 15:22 -0400, Konstantin Ryabitsev wrote:
> On Mon, Apr 06, 2026 at 03:13:52PM -0400, Sasha Levin wrote:
> I see that it's writing json out manually, implementing its own escaping.
> > > While there are upsides to not requiring a perl json library, I think=
 it's
> > > fair to expect that people who would want to get json output can prob=
ably make
> > > sure that JSON::XS is installed.
> > >=20
> > > Not a strong object, but seems cleaner that way.

To me too.

JSON:PP is standard since 5.14, and that's 15 years old.

I'd rather just require 5.14 as a minimum and remove
a bunch of other checks too.
