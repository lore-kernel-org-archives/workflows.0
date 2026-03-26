Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B7834C9AC;
	Thu, 26 Mar 2026 23:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566617; cv=none; b=U6KmWEUWC8TGGOqVMfoazgy55IRYOYOLOaTOq9P5THtwt171cTVOn1vPKE9Qj04n/BDtWXA4zQAtcYEVBKxjPNbVOf/EyeVFHB8dXbZqaMSnsO2dwsl60hbzub/bU/YyD7N9N7lJ/vs9XEx0MNphsYS55Qq3hq2vtdRiWlgt3M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566617; c=relaxed/simple;
	bh=ct0ieeD5W7ZarpmxM6pq13ptlhUiF5jltr2a7IxXyXg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mst59EjlVcRJpiTnJrqdjl8G8EV2VUxaEzV4Xhfs7TlkwBfYnQ+Xl64/D1212RgJvdsqdEFADKVFXN1yurlIPZzbP9yzK4WfjkI5Uc6VhSXfP3tIFP5bmvD0TY5UdcQnqoEBDIMtepIeFNrhAmTftMuf4/gsvw03NItrHsnlz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 9058516072F;
	Thu, 26 Mar 2026 23:10:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id F23A721;
	Thu, 26 Mar 2026 23:10:05 +0000 (UTC)
Message-ID: <3217a61e50f7b9fd387b908c0907bd0bf889bebb.camel@perches.com>
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
From: Joe Perches <joe@perches.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, Jonathan
 Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 16:10:05 -0700
In-Reply-To: <acW6Iar6XOzO9IfN@google.com>
References: <acTPXMJfkHLeItrK@google.com>
	 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
	 <acVIBseRrqJI8Uwb@google.com>
	 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
	 <acWnbG3nGjfYeYXh@google.com>
	 <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>
	 <acW6Iar6XOzO9IfN@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: F23A721
X-Stat-Signature: eshd43t9zifrxnx8n4dtciku6htopx6y
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19rHKmjHMUI4NZLoMSyqR6PoG01n2Mdhfk=
X-HE-Tag: 1774566605-175688
X-HE-Meta: U2FsdGVkX18hiqbBK1B546emCqjbdgEEWNMGZHaHWYqnaq7BWUy3ENM7Y5gHovk9jhWeopnxQFmQ71NH0HCZP+4Mv28cDlqgjvunuvNk/KLZPdlQhpZIkGAUJRvJs0VYqTpa1jc1RcIgQYAPeVq2Zq6f7c77EpCVNKucKg8WMRy8VvvaKdcwihXT5OPuCYSxoZNKiABzoqZ+QN+0+lrqYIV69czZ8BVxCC0ppHk7tv7CMkJIkAYb8PtCSlBs97Qk0mgplWcmTxiOV3cKaYgBhpKAsMym9YpVGfDNK/kCpo97HRadgmF63kcZBQPktgmJ

On Thu, 2026-03-26 at 16:04 -0700, Dmitry Torokhov wrote:
> On Thu, Mar 26, 2026 at 03:56:27PM -0700, Joe Perches wrote:
> > I gave you feedback.  You elided it.
> Could you please point me to it? All I saw is "just save it"

Seems constructive to me.
